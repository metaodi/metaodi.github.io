---
date: Mon Apr 11 2005 00:00:00 GMT+0200 (CEST)
categories: 
    - Programming
    - C
title: Release Hostages
---


Problem
=======

There are 7 (this could be optional maybe) hostages. They will be jailed
into 7 rooms and they cannot communicate during this time. They can
discuss 1 hour before they get jailed. They know that the will be
choosen randomly every day to go into an 8th room, where the can turn on
and off a light.

When someone can say surly that every hostage was a least once in this
room, they are all released.

At the beginning the light is turned off.

Idea
====

Every hostage has a week, so there are anz\_host weeks as a minimum to
free the hostages. If a hostages get’s into the anz\_host++ room, he/she
turn’s on the light.

Everybody who comes in this week after the turn up of the light happens
in the room, knows that the hostage week\_num has been in the room.
Maybe it get’s more evective if I use a larger window than a week,
because then, the chance that more other hostages sees who’s got in the
room is larger, but the time will grew up a lot.

Well let’s give it a try.

btw: You have to watch carfully which hostage knows what…

Code
====

[See pastie](http://pastie.org/663166) for the complete code

Result
======

I tried my program on Windows and Linux (just to get better results,
because of the random number implemention and the time function, be
careful if you want to port the code, the obove should work well with
windows)

My solution seems to be ok, an average of 90 days with the basic set.
But as you can see there are a lot of option to change the basic set and
then my solution still works well.

Use the option -H or /? to get help with the options.

PS: I’m not yet good at the effective programming and I’m sure there is
an easier way to do things I did in my code. Feel free to tell me what
you think (via mail until my comment system works)

PPS: Special thanks to my brother Dani
([](http://www.swissbytes.de)[www.swissbytes.de](http://www.swissbytes.de)),
who gave me the idea to this problem and wrote a perl script to simulate
his solution (well he wasn’t that successful, because his average is
about 500 days I think and surly his script ran much slower than my fast
C application ;) )

![Creative
Commons](http://creativecommons.org/images/public/somerights20.gif)

This work is licensed under a [Creative Commons
License.](http://creativecommons.org/licenses/by-sa/2.0/)

