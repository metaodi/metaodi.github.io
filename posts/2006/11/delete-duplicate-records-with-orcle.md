---
date: Tue Nov 07 2006 00:00:00 GMT+0100 (CET)
categories: 
    - Oracle
    - SQL
title: Delete duplicate records with Orcle
---


Don’t ask me why I needed to do that, but I had a lot (about 14 Mio.)
duplicate records in a table.

    DELETE FROM our_table
    WHERE rowid not in
    (SELECT MIN(rowid)
    FROM our_table
    GROUP BY column1, column2, column3... ;

helped me out. (thanks to [](http://www.devx.com)[www.devx.com](http://www.devx.com))

Next time I write my queries to filter those out before inserting them…

