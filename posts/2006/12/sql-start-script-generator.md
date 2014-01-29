---
date: Tue Dec 12 2006 00:00:00 GMT+0100 (CET)
tags:
    - Python
    - SQL
    - Programming
title: SQL Start-Script generator
---


Sometimes it’s so simple:

    import glob
    files = glob.glob('*.*');
    f=open('start_script.sql', 'w')
    f.write('PROMPT This is an automatic generated start script\n');
    f.write('PROMPT\n');
    f.write('SPOOL start_script.LOG\n\n');
    for filename in files:
        if filename == 'start_script.sql':
            continue
        f.write('PROMPT Starting script ' + filename + '\n');
        f.write('@@' + filename + '\n');
    f.write('\nPROMPT\n');
    f.write('PROMPT Finished.\n');
    f.write('SPOOL OFF\n');
    f.close();
    exit();

Explanation:
------------

First get a file list of the current directory (glob.glob(‘*.*’), this
won’t return you directories since they don’t have an extension, if your
files doesn’t have an extension, either: your fault). Then open a file
called start\_script.sql which will held our start-script (pretty
self-explanatory). Then we generate a “@@” line for each file (this
means if you have non-SQL-files in that directory you have to clean-up
your script or edit it that it only takes .sql files (tip:
glob.glob(‘\*.sql’)). The start-script itself is excluded but the python
script will be included (can easily be made excluded as well). After the
loop the file gets closed and that’s it.

