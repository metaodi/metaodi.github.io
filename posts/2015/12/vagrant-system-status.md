---
date: 15.12.2015
tags: [Programming]
title: Check the status of all vagrant boxes on your system
---

If you are like me, chances are you have a vagrant setup for each project your working on.
It's a great way of sharing a specific system configuration, especially if you work in a team of developers.
In my team, we have people running their systems with different operating systems and settings in general.
So vagrant is a real life-saver when it comes to developing together and agreeing on a setup for a specific project.

But there are some pain points.
If you turn off your machine, but forget you have a vagrant box running, the shutdown gets stuck, because it waits for the virtual network interface to be freed, which never happens
To solve this issue, it's important to know, what instances are still running.
If you only have one or two setups, this might be easy.
But it soons gets a tedious task to keep track by yourself.

Luckily vagrant provides us with a nice command to show all boxes on a machine called `global-status`:

```bash
vagrant global-status
```

This shows all instances, that are known to vagrant.
The results are cached and updated from time to time.
In my case, it didn't recognize all of my instances.
Unfortunately, the only way to change that is the rebuild the box.

What I did instead is create a little script, that collects it's own data (based on the existance of `.vagrant` directories).
This gives a more fine-grained view of the system and I have better control over when the data is updated.

![vagrant-cache in action]({{urls.media}}/vagrant-cache.png)

`vagrant-status` collects the data and updates the cache (slow operation).
I run it every 15min as a cronjob, to keep the cache up-to-date.

`vagrant-cache` simply displays the result of the last run of `vagrant-status`.

You can find the [scripts on GitHub](https://github.com/metaodi/vagrant-system-status).

