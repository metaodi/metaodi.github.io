---
date: 13.02.2019
categories: [Open Data, CKAN]
title: "Export datasets from CKAN on the command line"
---

Today I got an interesting request, about how datasets could be exported from CKAN based on a search query.

Our Canadian friends created [ckanapi](https://github.com/ckan/ckanapi), a CLI application (that can be used in python scripts as well!) to talk to the CKAN API.
This is basically all we need to fulfill the request.

In this example I'm using the [CKAN portal of the City of Zurich](https://data.stadt-zuerich.ch/), and we try to download all ["Fahrzeiten" datasets from the VBZ](https://data.stadt-zuerich.ch/dataset?q=Fahrzeiten). 
These datasets are super interesting, as they contain a target/actual comparison of the public transport timetable of Zurich (i.e. delays of buses and trams).

With `ckanapi`, it's quite easy to get the metadata of all these datasets:

```bash
ckanapi action package_search 'q=title:Fahrzeiten' -r https://data.stadt-zuerich.ch
```

This returns a JSON (since that is what the API returns) with all the datasets and their metadata.

But actually we want to download the files as well.
Luckily, `ckanapi` has a feature to _dump_ a dataset as a [Data Package](https://frictionlessdata.io/data-packages/).
A Data Package is essentially a directory containing the metadata in the root and the actual files in a `data` folder.
So this is exactly what we want.

Now let's use some CLI magic to turn our result from above into Data Packages.

First of all, the `ckanapi dataset dump` command takes a list of dataset names as a parameter, so let's generate such a list:

```bash
jq ".results|.[]|.name"
```

[jq](https://stedolan.github.io/jq/) is a tool to manipulate JSON on the command line (like `sed`, `awk` and `grep` for text).
In this example we simply extract the `name` attribute all all elements in the `results` key.

Now all we have to do is use this list in `ckanapi dataset dump`.
Let's put everything together:

```bash
ckanapi action package_search 'q=title:Fahrzeiten' -r https://data.stadt-zuerich.ch | jq ".results|.[]|.name" |  xargs -I % ckanapi dump datasets % -r https://data.stadt-zuerich.ch --datapackages=./dump_directory/
```

Remember, using `|` let's you reuse the output of one command as the input for the next one.

Voilà, we're done and all the datasets containing "Fahrzeiten" in their title will be downloaded to the `dump_directory`.
