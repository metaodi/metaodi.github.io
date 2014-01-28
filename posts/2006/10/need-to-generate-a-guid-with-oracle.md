---
date: '2006-10-18'
tags: 
    - Oracle
    - SQL
title: Need to generate a GUID with Oracle?
---


I just searched the web for this simple task, and it was difficult to
find.

Maybe anyone working a bit with Oracle knows this, but it helped me,
maybe I can help someone out there too, so here it is:

    select sys_guid() from dual

This generates a 32 character GUID (fits best in a RAW(16) field).

