---
date: Mon Jul 12 2010 13:57:00 GMT+0200 (CEST)
categories: [utPLSQL, Oracle, Unit Testing, PL/SQL]
title: Using utPLSQL with multiple schemas
---


I really like unit testing, and nowadays there is an helping framework
for almost every environment and/or programming language. For PL/SQL
this is [utPLSQL](http://utplsql.sourceforge.net/), which consists of a
bunch of packages that you need to put on your database and then you
should be good to test your could. You *should*.

I just spent some hours debugging my test code, so I want to share this
with you, maybe I can save someone out there some time.

### My setting

-   **Schema A:** utPLSQL package
-   **Schema B:** package XY (code to test), package UT\_XY (test code)

I have two schemas A and B. In schema A utPLSQL is installed, and in B
is the code to test. It is recommended to have your code to test and
your test code in the same schema.

The following script is used to run the tests:

     begin
       for c in (select object_name,owner
                   from all_objects
                  where object_name like 'UT\_%' escape '\'
                    and object_type ='PACKAGE')
       loop
         begin
         utPLSQL.test(
           package_in => substr(c.object_name,4),
           prefix_in => 'UT_',
           owner_in => c.owner
         );
       exception
         -- in case of a faulty unittest continue with the others.
         when others then
           null;
       end;
       end loop;
     end;
     /

But I kept getting the error:

     Program named "XY" does not exist.

So I thought that somehow the schema A does not “see” the packages in
the schema B and created public synonyms. Unfortunately this didn’t
help. Then I tried to move the “UT\_” package to schema A, which worked,
but now I got an error that the code to test and the test code are in
different schemas.

There must be something obvious I’m missing!

And there it was: A had not “execute” grant on the packages in B.

      grant execute on b.xy to A;

Now everything just worked fine.

