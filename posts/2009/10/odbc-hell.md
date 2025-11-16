---
date: Wed Oct 21 2009 16:27:00 GMT+0200 (CEST)
categories: [Oracle, PHP, PL/SQL, SQL, Programming]
title: ODBC Hell
---


It is so easy: I have a testing environement where an OCI8-Driver is
installed. Therefore I can use the OCI-Function if PHP to Bind
Variables, get return values and everything is just fine.

Then on the production I needed to switch to ODBC, and thought: Easy
just write this stuff for ODBC and you’re done.

Unfortunately the driver does simply not support return values of
functions. The problem is, that there are updates in my function, so I
can’t solve the problem using:

    select function_name(param1,param2,param3,...) from dual

After giving up my return value, I wanted to run the function like that
(in TOAD this is no problem):

    begin :retval := function_name(?,?,?,?); end;

Afterwards you are giving an array of parameter to the PHP function
odbc\_execute, and this should work alright.

I tried hundrets of possibilities to run my function. Finally I gave up,
made a procdure (which has no return value and vor sure ODBC has no
support for OUT or INOUT-Vars). I resigned to have a return value (which
should only be the number of updated rows).

I tried: begin procedure\_name(?,?,?,?); end;

There was no reaction. My last try:

    call procedure_name(param1,param2,param3,..);

This woked! So I need to use “call” and not using the parameter-array of
ODBC but giving it directly into the call. I’m happy to get it working,
but this costs me one day.

Is there any really working ODBC-Driver for PHP?

I gave up.

PS: Yes I know, there is a solution for my return value. In my procedure
I could write the value into a temporary table. But I rather want to use
a good driver (like the OCI8) than using such a temporary solution. I’m
open to new ways of doing this.

