---
id: 220828098
link: http://odi.tumblr.com/post/220828098/generate-n-rows-from-dual
slug: generate-n-rows-from-dual
date: Fri Oct 23 2009 12:44:00 GMT+0200 (CEST)
publish: 2009-10-023
tags: SQL, Oracle
title: Generate n rows from dual
---


I needed to generate exactly n rows and then this is very handy.

    select * from (
    select level lvl
    from dual
    connect by level <= N
    )

Found at:
[](http://awads.net/wp/2005/07/01/generating-n-rows-from-dual/)[http://awads.net/wp/2005/07/01/generating-n-rows-from-dual/](http://awads.net/wp/2005/07/01/generating-n-rows-from-dual/)

