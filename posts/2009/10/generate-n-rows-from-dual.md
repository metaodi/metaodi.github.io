---
date: Fri Oct 23 2009 12:44:00 GMT+0200 (CEST)
categories: [SQL, Oracle]
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

