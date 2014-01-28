---
date: Tue Oct 25 2005 00:00:00 GMT+0200 (CEST)
tags: csv
categories: Tech
title: CSV seperator character
---


In my particular case I got an excel sheet from the customer to import
in a DB. The idea is to use a CSV as the base for an Oracle external
table and then import the data in the real table with a “insert into
select”.

When I loaded the excel sheet and saved it as a CSV, the semicolon (“;”)
was used as a seperator. I therefore created my external table and
worked with the data. Then i realized that the order of the fields get
messed up, because there were free text fields that contained “;” as
data.

I didn’t find an option in excel to change the seperator character, but
as usually [Google is your
friend](http://www.google.com/search?q=excel+csv+separator+character).

This character is saved directly in your system in the “Region and
Language Options” in the “Control Panel” (yes, I’m talking about MS
Windows). You can selected there the “Customize” button and change the
“List separator” to the value you want.

First I tried to set this to “\#\#\#”, but this didn’t work, excel then
used a single space as separator. It seems it’s not allowed to use
multiple characters. Now, I use “\#” and everything works fine.

