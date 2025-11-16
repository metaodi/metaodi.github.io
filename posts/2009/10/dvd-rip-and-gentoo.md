---
date: Fri Oct 23 2009 12:44:00 GMT+0200 (CEST)
categories: [Linux]
title: dvd::rip and gentoo
---


[dvd::rip](http://exit1.org/dvdrip/) (or dvdrip at the gentoo
repository) is a very comfortable ripping software to bring your DVDs on
your harddisk.

When I emerged it and wanted to rip a dvd, I just got no result.

1.  the logfile showed no error
2.  in the status bar the text appeared Grab
    `preview - title #3 Duration: 00:01 [Error]`
3.  dvd::rip did nothing.

The chapter has been ripped and the file existed on the filesystem, but
I was unable to transcode it or do anything else with dvd::rip.

A lot of googling did not provide the solution, but finally I saw that
dvd::rip prints the exact command that is executed in the logfile, so I
tried to run it manually to eventually see an error.

And then there was theerror:

    convert: no decode delegate for this image format `/tmp/dvdrip24111.snap/snapshot001.png'.

I quick search with that showed me, that the problem was imagemagick,
which obviously did not have png support. I added the USE-flag “png” to
imagemagick in /etc/portage/package.use and re-emerged imagemagick.

Another problems was that transcode was missing the “mp3” USE-flag.

Since then dvd::rip just works!

