---
date: 21.09.2016
tags: [Programming, Open Data, API, ERZ, JavaScript]
title: Receive push notifications for waste collection in your area (OpenERZ)
---

Some time ago, I built the [OpenERZ API](http://openerz.herokuapp.com/) (and [wrote about it on this blog](http://metaodi.ch/posts/2015/01/openerz/)).
The API provides a nice and easy way to the waste collection data of the City of Zurich, provided by [Entsorgung + Recycling Zürich (ERZ)](https://www.stadt-zuerich.ch/ted/de/index/entsorgung_recycling.html) via the [Open Data Portal of the City of Zurich](https://data.stadt-zuerich.ch/dataset?tags=entsorgung).

OpenERZ provides iCal calendars, so that you can create a custom calender for the types of waste and the the ZIP code your interested in and put that in your digital calendar.

But for me the killer feature is the get push notifications.
There used to be a free SMS service from ERZ to remind you of the waste collection (e.g. to put your cardboard in front of your house, so that it gets collected the next day).
Unfortunately they shut down this sevice and launched their own app.

So here I am, with an API that has all the data and the need for push notifications.
Instead of building everything from scratch, I decided to look into existing solutions.
The first thing, that came to my mind was [IFTTT](https://ifttt.com), the universal recipe tool to connect different services.

It has almost everything I need:

* A time based trigger, to run something every day (think _cron_)
* A so called channel to make and receive web requests (it's called ["Maker" on IFTTT](https://ifttt.com/maker))
* A channel for Pushover, a service to receive push notifications on your phone (there are other options to do this, but this is my current choice)

To glue these together, only a little script is needed, that makes API requests to OpenERZ and _transforms_ these into single messages that can be received as a push notification.
For this purpose I created the [erz-trigger project](https://github.com/metaodi/erz-trigger).
It's a small node application that I deployed to Heroku.

If you make a GET request to the application, it calls the OpenERZ API for waste collections of the following day with the given zip code.
It then makes a call to the Maker channel web hook for each waste collection returned by the API.
IFTTT takes care that I get a push notification, if the web hook is called.

![Push notification]({{urls.media}}/push_notification.png)

In the end, I have the heroku instance running and setup two recipes on IFTTT:

![Recipe for webhook -> push]({{urls.media}}/webhook_recipe.png)
![Recipe for time -> web request (cron)]({{urls.media}}/cron_recipe.png)

To make it a little more secure, the application is protected by an API token.
So feel free to launch your own instance of erz-trigger, just make sure to configure your own token and to provide your API key of IFTTT.




