---
id: 220769565
link: http://odi.tumblr.com/post/220769565/find-old-files-and-their-size
slug: find-old-files-and-their-size
date: Fri Oct 23 2009 10:25:06 GMT+0200 (CEST)
publish: 2009-10-023
categories: [Linux]
title: Find old Files and their size
---


The first part is clear, find the old files like that:

    find . -type f -mtime +365 -print

This gets all Files (`-type f`, `-type d` for directories) in the
current directory (`.`) older than a year (`-mtime +365`) and prints
them on stdout (`-print`)

to delet them, just use:

    find . -type f -mtime +365 -exec rm {} \;

But if you want to use them further, a pipe will help you. For any
reasons (I don’t know) this is not possible with the `-print` command.
My Solution was the following:

    find . -type f -mtime +365 -exec echo {} \;

Now, because there are possibly many many many files, it’s best to use
xargs for the argument handling. I use `du -ch` to determine the
file-size and the total:

    find . -type f -mtime +365 -exec echo {} \; | xargs du -ch

This should help, Google helped me half-way out, the rest is a little
command line magic.

Note: In my case there where really too many files, so that the whole
command ended with a broken pipe. I used `-type d` to reduce the amount
of arguments, the disadvantage is that directories are not necessary the
same age as the files within.

