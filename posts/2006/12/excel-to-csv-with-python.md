---
date: Wed Dec 27 2006 00:00:00 GMT+0100 (CET)
tags:
    - Programming
    - Python
    - Excel
    - CSV
title: Excel to CSV with Python
---


I wanted to handle a simple task: convert a bunch of XSLs to CSVs. Well
I wrote a small Script in VBScript and it worked. Then I needed to
change the List separator, so I did that in my System settings, and then
my Script didn’t work anymore, because it just ignored my changed
settings.

I googled a lot and didn’t find the solution (only people with the same
problem). It seems that VBScript (or WSH) is using it’s own locale that
you can not change.

So I began to look for alternatives. Python can handle the COM interface
when you install PyWin32 (the version must match the python version
you’re using). So I just rebuild my script with python and it’s
COM-Interface. Et voil�: it takes the user defined settings and converts
my files in the way I want them.

    #import win32 stuff
    from win32com.client import Dispatch
    #import other needed
    import glob,sys,os

    path = os.path.split(sys.argv[0]) #gather the path of the script
    path = path[0]
    path = path + '\\' #append \ at the end of path (when using *NIX you must use / instead
    files = glob.glob('*.xls') #get list of files

    xlApp = Dispatch("Excel.Application") #create Excel COM-Object
    xlApp.DisplayAlerts = False
    for file in files:
        xlWB = xlApp.Workbooks.Open(path + file)
        xlWB.SaveAs(path + file.replace(".xls",".csv"), 6 ) #6 = xlcsv
        xlWB.Close()
    xlApp.Quit()
    del xlApp

