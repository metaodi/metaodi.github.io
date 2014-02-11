---
date: 11.02.2014
tags: [MongoDB, Open Data, OpenStreetMap, GIS]
title: Usage of MongoDB with a spatial index and GeoJSON
---

During the [Zurich Hacknights 2013](http://opendata.ch/projects/open-data-zuerich-hacknights/) I was part of the team, that wanted to build a [guide for monuments in Zurich](http://make.opendata.ch/wiki/project:denkmalfuehrer).
We were a large group of people with lots of ideas.
Unfortunately I was the only web developer at that time, so I did my best to create a [prototype of the guide called _Denkmap_](https://github.com/denkmap/denkmap).

There is a [webservice (WFS) of the GIS-ZH containing all monuments of the Canton](http://www.geolion.zh.ch/geodatenservice/show?nbid=691).
I converted the source to [GeoJSON](http://geojson.org/) using [ogr2ogr](http://www.gdal.org/ogr2ogr.html):

```bash
wget -O DenkmalschutzWFS.gml http://maps.zh.ch/wfs/DenkmalschutzWFS?service=wfs&version=1.1.0&request=GetFeature&typeName=denkmalschutzobjekte
ogr2ogr -f geoJSON -s_srs EPSG:21781 -t_srs EPSG:4326 denkmal.geojson DenkmalschutzWFS.gml
```

I added the result as a layer to the map.
This worked, but unfortunately the GeoJSON file is about **7MB**.
And each client has to download it.
This takes time, especially on mobile devices not connected to a WLAN.

**For a prototype this was okay, but how can we solve this for the future?**

At this point it was clear that I need some part running on a server.
This part must be able to divide all my data in reasonable chunks, that the client is able to download in a short time.
Because I'm  already dealing with GeoJSON and I didn't yet use [MongoDB](http://www.mongodb.org/), I wanted to give it a try.
I read that there is a [spatial index](http://docs.mongodb.org/manual/applications/geospatial-indexes/) and the possibility to run [spatial queries](http://docs.mongodb.org/manual/reference/operator/query-geospatial/).
Hence, I had my perfect candidate.
The other obvious solution would have been [PostgreSQL with PostGIS](http://postgis.net/).
This would have worked too, but I wanted to try something new. 

### Import GeoJSON in MongoDB

This is quite easy if you respect the rules set by the [`mongoimport` command](http://docs.mongodb.org/manual/reference/program/mongoimport/):

1. There used to be a `FeatureCollection`, which basically is a big array. I removed it to get a list of objects.
2. Only use the MongoDB-supported subset of GeoJSON (i.e. Point, LineString and Polygon)
3. The file must contain exactly one object per line, remove extra lines to make the importer happy

Once this is done, you can run the following to import your GeoJSON in a database called `denkmap` and a collection called `wfsktzh`:

```bash
mongoimport --db denkmap --collection wfsktzh < denkmal.geojson
mongo denkmap --eval "db.wfsktzh.ensureIndex({geometry: '2dsphere'})"
```

### Create RESTful interface to consume the data

Once the data is save and sound in MongoDB, all you need is a script to expose exactly the data you need.

The [Sinatra-like `express` framework](https://www.npmjs.org/package/express) helps to create the structure:

```javascript
var express = require('express'),
    geodata = require('./geodata.js'),
    app = express(),
    port = 3000;

app.get('/nearby/:lat/:lon', function(req, res) {
    console.log(req.method + ' request: ' + req.url);
    var lat = parseFloat(req.params.lat),
        lon = parseFloat(req.params.lon);
    geodata.nearby(lat, lon, function(docs) {
        res.send(docs);
    });
});

app.listen(port);
console.log('Listening on port ' + port + '...');
```

This allows us to query MongoDB using URLs like this: [http://localhost:3000/nearby/47.3456/8.5432](http://localhost:3000/nearby/47.3456/8.5432)

The `geodata.js` contains the spatial query using `$near`. It returns all results in 1000m distance from the given coordinates (lat/lon). [`mongojs` is a Node.js library for MongoDB](https://www.npmjs.org/package/mongojs):

```javascript
var dbUrl = "denkmap",
    coll = ["wfsktzh"],
    db = require("mongojs").connect(dbUrl, coll);

exports.nearby = function(lat, lon, callbackFn) {
    db.wfsktzh.find({
        geometry: {
            $near: { 
                $geometry : {
                    type: "Point",
                    coordinates: [lon, lat]
                },
                $maxDistance: 1000
            }
        }
    },
    function(err, res) {
        callbackFn(res);
    });
}
```


By the way: the project is still active and we are still looking for people to participate.
The next step would be to connect DenkMap to [WikiData](http://wikidata.org) and display some extra information, link to the corresponding Wikipedia page, and/or display images of the monument in the app.
