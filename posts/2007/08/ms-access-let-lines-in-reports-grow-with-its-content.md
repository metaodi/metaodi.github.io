---
date: Fri Aug 24 2007 12:54:00 GMT+0200 (CEST)
categories: Tech
tags:
    - MS Access
    - VBA
    - Programming
title: "MS Access: Let lines in Reports grow with it's content"
---


The problem is the following: You create a report with MS Access with a
text field. To display the whole text, you have to set the “CanGrow”
property to “Yes” (on the section and on the text-field). When running
the report that has vertical lines as column seperator you have an ungly
effect: The line keeps its size, as this has been fixed in the design
view.

One might think that the easy solution is to adjust this length at
runtime. First of all I need to declare what “runtime” means. As this
problem occures in every “Detail”-Section we must dive in the events a
section provides. There are three of them “OnRetreat”, “OnFormat” and
“OnPrint” (apart all the mouse events, which are defenitly not
suitable).

The Retreat-Event occurs “when Microsoft Access returns to a previous
report section during report formatting” (Source: VBA Help). Not exactly
what we’re looking for.

The Format-Event occurs “when Microsoft Access determines which data
belongs in a report section, but before Access formats the section for
previewing or printing”. It sounds good, but at this point we don’t have
our data in the section and are therefore unable to determine the
correct height.

Finally the Print-Event “after data in a report section is formatted for
printing, but before the section is printed”. Here we are, we have our
data which is not yet printed. The problem is that at this point all
elements are already formatted, all we can do is add new elements and
that’s why we can’t just adjust the height of each line by setting it
via

     Me.myLine.Height = Me.Height '''this does not work in the OnPrint event, myLine has already been formatted

The simple solution is to draw a new line and use your already placed
line as a template:

    Private Sub Detail_Print(Cancel As Integer, PrintCount As Integer)
        Dim EndOfLine As Double
        EndOfLine = Me.Height       ''height of section (where the line stops)

        ''becasue it's not allowed in such a late state to change lines, we draw new one's based on the old
        ''myLine
        Me.Line (Me.myLine.Left, 0)-(Me.myLine.Left, EndOfLine)

    End Sub;

