---
date: Fri Oct 23 2009 15:19:00 GMT+0200 (CEST)
categories: Tech
tags: Linux
title: Delete all symlink of a directory
---


It seems like a simple task, and it really is. But I always have to
google for such simple stuff, that’s why I start to post things here, so
I don’t have to look up the same things over and over again.

To list all files of a directory you can use (sort by date)

     $ ls -lt
    total 35
    lrwxrwxrwx   1 oracle   dba           13 Jan 30 09:47 etc -> /etc/
    drwxr-xr-x   2 oracle   dba         8192 Jan 29 11:40 data
    drwxr-xr-x   2 oracle   dba         8192 Jan 29 11:23 info
    drwxr-xr-x   2 oracle   dba         8192 Jan 20 15:27 main
    -rwxr-xr-x   1 oracle   dba         2643 Dec 18 15:11 run.sh
    drwxr-xr-x   2 oracle   dba         8192 Nov 20 14:16 _old

As you can see the symlink is marked with the “l” at the beginning, you
can use that to get only links in the output using grep:

     $ ls -lt | grep '^l'
    lrwxrwxrwx   1 oracle   dba           13 Jan 30 09:47 etc -> /etc/

To delete the files we are only interested in the filename this can be
done using awk. Finally xarg is a tool that runs a given program on
every element of it’s input, so the final task can be done by:

     $ ls -lt | grep '^l' | awk '{ print $9 }' | xargs rm

