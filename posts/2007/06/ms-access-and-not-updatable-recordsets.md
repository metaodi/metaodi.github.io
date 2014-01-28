---
date: Sat Jun 30 2007 01:49:00 GMT+0200 (CEST)
categories: Tech
tags: 
    - MS Access
    - Programming
title: MS Access and not updatable Recordsets
---


The whole thing is just plain stupid: Someone in the department I work
in has created an MS Access Database to track our customers. Above this
application are some forms to insert the data. Now we already have much
of the data in various excel sheets etc. So my task was to write a
function (or method or sub or whatever you call it in your world) to get
some values from an excel sheet and insert it to a form, just like a
user would do it. Like that the user has the possibility to check and
change the data before it gets saved in the database. Now if you bind
the form elements to parts of a query, Access gets your data as a so
called snapshot via MS Jet (your communication channel to the DB).
Snapshot data is not updateable, so if you try to assign your own values
to form elements an error message pops up and that’s it.

My first solution was to ignore that fact and simply update my data
directly to the database. But then all nice features like the “undo”
option (to reset a record) or the possibility to check values before
they get inserted are lost. The solution I came up is simple, but you
need to check your status very exact to keep a usable form.

I have a form with my data, I have a save button, I have an exit button
and I have an update button. There is a special button to start the
gathering of data from the excel sheet. Now If you want to change the
value of a textbox on the form you need to cut the textbox off the data
(`ControlSource = ""`), then you can freely change the value.

Now you can’t simply update the current record, because the textbox is
no longer in the recordset. This means that you have to update the value
directly in the database when the save button is pressed. Then reattach
the ControlSource and Requery and Repaint your form.

When you want to Undo your changed, just don’t save your values in the
DB and reassign the ControlSource and Refresh the form, the old value
will appear.

