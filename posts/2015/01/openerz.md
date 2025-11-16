---
date: 01.01.2015
categories: [Open Data, ERZ, API, CSV, JavaScript, MongoDB]
title: Why and how I created the OpenERZ API
---

The holidays season is always a good point in time to reflect and sort ideas/thoughts etc.
A number of reasons lead me to create the [OpenERZ API](http://openerz.herokuapp.com).

It all started about a month ago, when I got the new calendar of Entsorung und Recycling Zürich (ERZ) with the dates for the different waste collections.
This is a phyisical paper thingy that is sent to all households in Zurich.
There was also an information attached that ERZ has its own iOS and Android app, so you have the same data in an eletronic format on your personal smartphone.

That's when it got interesting.
I knew that ERZ already published their data as CSVs on the [Open Data portal of the City of Zurich](http://data.stadt-zuerich.ch/).
I also knew that my fellow open data enthusiasts already created a [smartphone app](https://play.google.com/store/apps/details?id=ch.bretscherhochstrasser.android.entsorgungzuerich) with that data.
What I didn't know at that point was, if there has been any kind of communication between those parties or how this all fits together.

[Via twitter](https://twitter.com/andreasamsler/status/539033563149402113) I got confirmation, that there was indeed no communication.
Unfortunately ERZ did not contact the original developers and did not engage with the official Open Data team of the City of Zurich.
André Golliez wrote an ["open letter" to the CEO of ERZ](http://opendata.ch/pressearchiv/offener-brief-zur-smartphone-app-sauberes-zuerich/).
After that there were replies, meetings etc. to clear things up.

What really caught my attention was the reply of SR Filippo Leutenegger, where he stated:

> "Die Datenbank steht im Zentrum, die App «Sauberes Zürich» ist mit ihren drei Betriebssystemen ein Output aus der Datenbank. Die Datenbank steht im Zentrum, die App «Sauberes Zürich» ist mit ihren drei Betriebssystemen ein Output aus der Datenbank."

So they created a database, which makes it easier for them to update the data.
And this database is used for the print products, the apps and possible other clients like their website (not sure if that's the case though).
For me it was clear, that there is a need for an API on top of this data, no matter what client uses this.
A database is a good start but an API is how data becomes really useful and easy to integrate.

My first thought was, that the developers of the new app already created an API, but just didn't tell anyone.
That would've been perfect, as all I had to do, was find this hidden API and create a public proxy to it.
To investigate this, I downloaded [the app](https://play.google.com/store/apps/details?id=ch.erz.sauberes_zuerich), setup a [Charles proxy](http://www.charlesproxy.com/) and looked at the communication (thanks to my colleague [Franz](https://twitter.com/fterrier) for pointing me in the right direction here!).

I quickly found the calls of the app:

* `http://erz.w-4.ch/export/metadata.json` (first call)
* `http://erz.w-4.ch/export/wastetypes.json`
* `http://erz.w-4.ch/export/calendars-2014.json`
* ... etc.

So there we have all the data.
The `metadata.json` contains a list of available files, which are then requested by the client.
It looks like an export from the above-mentioned database, which is loaded when the app starts.
Of course, this is a kind of API, but not one that you can query for single records.

At this point, I decided to create the OpenERZ API.
The JSON from the app are not very clear and self-explanatory (they were not designed with that in mind).
So I decided to use the CSVs from the Open Data portal as a basis instead.
It was made clear by SR Filippo Leutenegger, that ERZ wants to continue to provide this data, so I think its a safe choice to build the API on top of that.

[![Screenshot of the OpenERZ swagger UI](/media/openerz.png)](http://openerz.herokuapp.com)

The OpenERZ API is a [node application](http://nodejs.org/) that runs on [Heroku](https://www.heroku.com/).
The process is quite simple: the CSVs are converted to JSON and transformed to be in a clear format.
After that, the nicely formatted JSON is imported in a [MongoDB](http://www.mongodb.org/) as documents.
Later this allows us to query the data easily.
And by using MongoDB, it's easy to extend the data model at a later point without breaking the application.

The routing part of the API is build using the [Hapi framework](http://hapijs.com/) and its ecosystem (Joi, hapi-swagger etc.).
After some iterations the current API gained some features:

* route for all the different waste types
* a list of stations
* data can be filtered and sorted  by different parameter
* GeoJSON of all the cargo and e-tram stops
* For the sake of completeness, I added the JSONs of the app as well, those are available at the /export route.

All the [code is on GitHub](https://github.com/metaodi/openerz), feel free to contribute, either with code, ideas or bug reports and of course use the API for whatever you want :)

