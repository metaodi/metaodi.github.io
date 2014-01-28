---
date: Mon May 14 2007 14:49:00 GMT+0200 (CEST)
categories: Tech
tags:
    - Excel
    - VBA
    - Programming
title: Convert fixed length column to Excel
---


I had to convert the output from sqlplus to an excel sheet. The problem
was, that I had no influence on the creation, so I could spool the file
directly to excel.

All I got were spool files like that:

          CLASS_ID SUPER_CLASS_ID   COUNT(*)
    ============== ============== ==========
           128           8765         18
           128           8765        131
           128           8765          7

My idea was to take the line used to seperate the column titles and the
data as the data that gives me the length of each column (refered as the
column line in my function below). Then just simply extract a block from
start to end (as given) based on the gathered column length information.

Maybe someone can use this piece of VBA code:

    Public Sub convertFixed()
        Dim sFile As String
        Dim iCount As Long
        Dim iSubCount As Long
        Dim iLastCount As Long
        Dim i As Integer
        Dim Length() As Integer
        Dim sValue As String

        Dim iStart As Integer
        Dim iEnd As Integer
        Dim iColumn As Integer


        ''clear previous data
        Cells.ClearContents

        ''choose the file with the windows file dialog
        With Application.FileDialog(msoFileDialogFilePicker)
        .AllowMultiSelect = False
        .Title = "Choose log file to convert"
        .InitialFileName = ThisWorkbook.Path
        .InitialView = msoFileDialogViewDetails
        .Filters.Clear

        ''the filter is set to .log .spool and .txt files
        .Filters.Add "Log file", "*.log, *.spool, *.txt"

        .ButtonName = "Load"
        If .Show = -1 Then
            sFile = .SelectedItems(1)
        Else
            ''stop execution if no file is selected
            Exit Sub
        End If
        End With


        ''we need the following informtion (gather with InputBoxes)
        ''line to scan the column lengh (space delimiteted) -> line number
        ''begin of block (line number)
        ''end of block (line number)
        iStart = InputBox("Enter line number where block starts:", "Line number of Start")
        iEnd = InputBox("Enter line number where block ends:", "Line number of End")
        iColumn = InputBox("Enter line number of fixed length specification", "Line number for fixed length")

        ''the first loop is to get the correct column length
        'open the file
        Open sFile For Input Access Read As #1
        iCount = 1
        ''loop until end of file (EOF) is reached
        Do Until EOF(1)
        Line Input #1, sLine
        If (iCount = iColumn) Then
            ''exit if the column line (to scan the length) is reached
            Exit Do
        End If
        iCount = iCount + 1
        Loop
        ''close the file
        Close #1

        iCount = 0
        iSubCount = 1
        iLastCount = 0
        ''sLine now contains a line that gives us the fixed length of the columns
        sLine = RTrim(sLine)
        Do Until iSubCount > Len(sLine)
        If (Mid(sLine, iSubCount, 1) = " " Or iSubCount = Len(sLine)) Then
            ''the Length array stores the length of each column (needs to be ReDim'ed with each new column)
            ReDim Preserve Length(iCount)
            Length(iCount) = iSubCount - iLastCount
            iLastCount = iSubCount
            iCount = iCount + 1
        End If
        iSubCount = iSubCount + 1
        Loop

        ''open the file to extract the block based on the column length stored in the Length-Array
        Open sFile For Input Access Read As #1
        iCount = 1
        iSubCount = 1

        ''loop until the end of the block is reached
        Do Until iCount > iEnd
        Line Input #1, sLine
        iLastCount = 1
        If (iCount >= iStart) Then
            For i = 0 To UBound(Length)
                sValue = Trim(Mid(sLine, iLastCount, Length(i)))
                ''prevent application errors with adding of "'" in front of special characters
                If (Left(sValue, 1) = "=" Or Left(sValue, 1) = "-" Or Left(sValue, 1) = "+") Then
                    sValue = "'" & sValue
                End If
                ''insert the data to the current Excel sheet
                Cells(iSubCount, i + 1).Value = sValue
                iLastCount = iLastCount + Length(i)
            Next i
            iSubCount = iSubCount + 1
        End If
        iCount = iCount + 1
        Loop
        ''close the file
        Close #1

    End Sub

