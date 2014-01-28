---
date: Wed Oct 21 2009 16:06:00 GMT+0200 (CEST)
tags:
    - Programming
    - Brainfuck
title: Brainfucked Logo
---


> ++++++++++[\>++++++++++\<-]\>——-\<++++++++++[»+++++++++++++«-]\
>  »———«+++++[»\>++++++++++«\<-]»\>—-«\<++++++++++[»»+++««-]\
>  »»++\>+++++++++++++««\<++++[»»»++++++++++«««-]»»»++++«.»\
>  [««\<.»»\>-]\<.«\<.«++[»»»+++++«««-]»»»[«.»-][-]«««++\
>  [»»»++++«««-]»»»-[««\<.»»\>-][-]«««++[»»»++++++++++«««-]\
>  »»»-[«.»-]««\<….»\>….«.»\>.«\<.»…»[-]«««++++++++++\
>  [»»»++++++++++«««-]»»»—.[-]«««++++++++++[»»»++++++++++++«««-]\
>  »»»+.«….\<.\>…….\<.\<.»….\<.«—-.+++..»\>……..\<.\>….\
>  \<.\<.»..«.»\>.«\<.»..»[-]«««++++++++[»»»++++++++++«««-]»»»-.\
>  [-]«««++++++++++[»»»++++++++++«««-]»»».+++++.«…\<.«……»\>.\
>  \<.\>.«.»…\<.\>…\<.«—-.+++..»\>….\<.«…»\>.\<.\>.«.»..«.»\>.«\<.».»\
>  [-]«««+++++[»»»++++++++++«««-]»»».—..++++.«..«.»…….«.»..\
>  «.»..«.\<—-.+++..».\>…\<.«—-.+++»\>..«.»….«.»..«.»..«.»\>.«\<.\
>  »…….«.»…«\<.»\>…«.»..«.»..«.».«\<.»\>.«\<—-.+++..».\>.\<.\>..«.\
>  »….«.»..«.»..«.»\>.«\<.»…….«.»..«.».«.»..«.»..«.»..«.».\
>  «\<.\>.»…«\<—-.+++».\>…«.»….«.»..«.»..«.»\>.«\<.»…….«.»\
>  …….«.»..«.»..«.»….«\<..».\>….«.»….«.»..«.»..«.»\>.«\<.»\
>  …….«.»…….«.».\<.\>…«.».«\<..».\>…….«.»….«.».\<.\>…«.»\>.\
>  «\<.»…….«.\<…….\>.\>.\>….«.\>.\>……….«.\<….\>.\>.\>….«.»\>.«\<.»»\
>  [-]«««++++[»»»++++++++++«««-]»»»++++[««\<.»»\>-]««.

Nice isn’t it?\
\
 Well, but you’re asking what this is all? I will give you the related
links as soon as my link-system is working. For now this little
explanation should help you, otherwise google for “Brainfuck tutorial”.\
\
 Brainfuck is a very small (esoteric) programming language. It was
design by a Swiss guy with the aim to write the smallest possible
compiler for a Turing-complete language (his size is about 240 bytes).\
\
 And sure Brainfuck is Turing-complete.\
\
 The context of the language is a large array with (depending on the
compiler and/or interpreter) about 30’000 array cells (each cell will be
initalized with 0).\
\
 The 8 instructions:\
**\>** change the pointer to the next cell\
**\<** change the pointer to the last cell\
**+** increment the cell value\
**-** decrement the cell value\
**[** begin of loop\
**]** end of loop (a loop stops is the value of the actual cell is 0)\
**,** read a value (input) into the actual cell\
**.** Print out the ascii sign belonging to the cell value\
\
 Depending on that I will print you my bf-code of above again, this time
with comments and so on:

>      ____________________________________________|          ________                   ____   ||   by    /        /|    /\__        /    /| ||  Odi   /_______ / |   /   /\__    /___ / | || 2004  |         | |  |\__/   /\  |    |  | ||       |    _    | |  | _ \__/ /  |    |  | ||       |   | |   | |  | _|   \/   |    |  | ||       |         | |  |    __/    |    |  | ||       |         | /  | __/       |    | /  ||       |________ |/   |/          |____|/   |                      |____________________________________________|                                

Brainfuck Pendant (commentent):

> FIRST PLACE IS THE FILL IN COUNTER PLACE\
> \
>  ++++++++++[\>++++++++++\<-]\>——- = 95 in 2nd place (ASCII for “\_”)
> (pos:2)\
>  \<++++++++++[»+++++++++++++«-]»——— = “|” (124) in 3th place (pos:3)\
>  «+++++[»\>++++++++++«\<-]»\>—- = “/” (47) in 4th place (pos:4)\
>  «\<++++++++++[»»+++««-]»»++ = SPACE (32) in 5th place (pos:5)\
>  \>+++++++++++++ = “New Line” (13) in 6th place (pos:6)\
>  ««\<++++[»»»++++++++++«««-]»»»++++ = 44 in 7th place (times to repeat
> “\_”) Use as Counter place (pos:7)\
> \
> \
>  //START Line 1\
>  «. = Print SPACE at the beginning of line 1 (pos:5)\
>  » = Change Pointer to 7 (pos:7)\
>  [««\<.»»\>-] = Print 44 times “\_” (pos:7)\
>  \<. = Change to 6th place and print NewLine (pos:6)\
>  //END Line 1\
> \
>  //START Line 2\
>  «\<. = Change to 3th place; print “|” (pos:3)\
>  «++[»»»+++++«««-]»»» = Fill Counter with 10 (pos:7)\
>  [«.»-] = print 10 SPACE (pos:7)\
>  [-] = Clean 7th place to 0 (pos:7)\
>  «««++[»»»++++«««-]»»»- = Set counter place to 7 (pos:7)\
>  [««\<.»»\>-] = Print 8 “\_” (pos:7)\
>  [-] = Clean 7th place to 0 (pos:7)\
>  «««++[»»»++++++++++«««-]»»»- = Set counter place to 19 (pos:7)\
>  [«.»-] = Print 19 SPACE (pos:7) \
>  ««\<…. = Change to 2nd place; print 4 “\_” (pos:2)\
>  »\>…. = Change to 5th place: print 4 SPACE (pos:5)\
>  «. = Change to 3rd place: print “|” (pos:3)\
>  »\>. = Change to 6th place: print NewLine (pos:6)\
>  //END Line 2\
> \
> \
>  //START Line 3\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  »… = Change to 5th place; print 3 SPACE (pos:5)\
>  »[-] = Clean 7th place (pos:7)\
>  «««  = Change pointer to 1 (pos:1)\
>  ++++++++++[»»»++++++++++«««-]»»»—. = Set 7th position to 98 (stands
> for “b”) and print it (pos:7)\
>  [-] = Clean 7th place (pos:7)\
>  «««  = Change pointer to 1 (pos:1)\
>  ++++++++++[»»»++++++++++++«««-]»»»+. = Set 7th position to 121
> (stands for “y”) and print it (pos:7)\
>  «…. = Change to 5th place; print 4 SPACE (pos:5)\
>  \<. = Change to 4th place; print “/” (pos:4)\
>  \>……. = Print 8x SPACE (pos:5)\
>  \<. = Print “/” (pos:4)\
>  \<. = Print “|” (pos:3)\
>  »…. = Print 4 SPACE (pos:5)\
>  \<. = Print “/” (pos:4)\
>  «—-. = Print “" (\_{95} minus 3 = \\{92}) (pos:2)\
>  +++.. = Print 2 “\_” (pos:2)\
>  »\>…….. = Print 8x SPACE (pos:5)\
>  \<. = Print / (pos:4)\
>  \>…. = Print 3 times SPACE (pos:5)\
>  \<. = Print “/” (pos:4)\
>  \<. = Print “|” (pos:3)\
>  ».. = Print SPACE (pos:5)\
>  «. = Print “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 3\
> \
>  //START Line 4\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  ».. = Change to 5th place; print 3 SPACE (pos:5)\
>  »[-] = Clean 7th place (pos:7)\
>  «««  = Change pointer to 1 (pos:1)\
>  ++++++++[»»»++++++++++«««-]»»»-. = Set 7th position to 79 (stands for
> “O”) and print it (pos:7)\
>  [-] = Clean 7th place (pos:7)\
>  «««  = Change pointer to 1 (pos:1)\
>  ++++++++++[»»»++++++++++«««-]»»». = Set 7th position to 100 (stands
> for “d”) and print it (pos:7)\
>  +++++. = Set 7th place to 105 (stands for “i) (pos:7)\
>  «… = Print 3 SPACE (pos:5)\
>  \<. = print “/” (pos:4)\
>  «…… = Print 5 “\_” (pos:2)\
>  »\>. = Print a SPACE (pos:5)\
>  \<. = Print “/” (pos:4)\
>  \>. = Print SPACE (pos:5)\
>  «. = Print “|” (pos:3)\
>  »… = Print 3 SPACE (pos:5)\
>  \<. = Print “/” (pos:4)\
>  \>… = Print 3 SPACE (pos:5)\
>  \<. = Print “/” (pos:4)\
>  «—-.+++ = Print “" (decrease “\_” about 3 back to the orgin) (pos:2)\
>  .. = Print 2 “\_” (pos:2)\
>  »\>…. = Print 4 SPACE (pos:5)\
>  \<. = Print a “/” (pos:4)\
>  «… = Print 2 “\_” (pos:2)\
>  »\>. = Print a SPACE (pos:5)\
>  \<. = Print a “/” (pos:4)\
>  \>. = Print a SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print SPACE (pos:5)\
>  «. = Print “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 4\
> \
>  //START Line 5\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  ». = Change to 5th place; print 3 SPACE (pos:5)\
>  »[-] = Clean 7th place (pos:7)\
>  «««  = change position to 1 (pos:1)\
>  +++++[»»»++++++++++«««-]»»». = Print “2” (50) (pos:7)\
>  —.. = Print 2x “0” (48) (pos:7)\
>  ++++. = Print “4” (52) (pos:7)\
>  «.. = Print 2 SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »……. = Print 9x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print a SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  \<—-.+++ = Print a “" (pos:2)\
>  .. = Print 2x “\_” (pos:2)\
>  ». = Print a “/” (pos:4)\
>  \>… = Print 3x SPACE (pos:5)\
>  \<. = Print a “/” (pos:4)\
>  «—-.+++ = Print a “" (pos:2)\
>  »\>.. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 5\
> \
>  //START Line 6\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  »……. = Change to 5th place; print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »… = Print 3x SPACE (pos:5)\
>  «\<. = Print a “\_” (pos:2)\
>  »\>… = Print 3x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print a SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ». = Print a SPACE (pos:5)\
>  «\<. = Print a “\_” (pos:2)\
>  »\>. = Print a SPACE (pos:5)\
>  «\<—-.+++ = Print a “" (pos:2)\
>  .. = Print 2x “\_” (pos:2)\
>  ». = Print a “/” (pos:4)\
>  \>. = Print a SPACE (pos:5)\
>  \<. = Print a “/” (pos:4)\
>  \>.. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 6\
> \
>  //START Line 7\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  »……. = Change to 5th place; print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ». = Print a SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print a SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ». = Print a SPACE (pos:5)\
>  «\<. = Print a “\_” (pos:2)\
>  \>. = Print a “|” (pos:3)\
>  »… = Print 3x SPACE (pos:5)\
>  «\<—-.+++ = Print a “" (pos:2)\
>  ». = Print a “/” (pos:4)\
>  \>… = Print 3x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 7\
> \
>  //START Line 8\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  »……. = Change to 5th place; print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »……. = Print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print a SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »…. = Print 4x SPACE (pos:5)\
>  «\<.. = Print 2x “\_” (pos2)\
>  ». = Print a “/” (pos:4)\
>  \>…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ».. = Print 2x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 8\
> \
>  //START Line 9\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  »……. = Change to 5th place; print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »……. = Print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ». = Print a SPACE (pos:5)\
>  \<. = Print a “/” (pos:4)\
>  \>… = Print 3x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ». = Print a SPACE (pos:5)\
>  «\<.. = Print 2x “\_” (pos2)\
>  ». = Print a “/” (pos:4)\
>  \>……. = Print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  ». = Print a SPACE (pos:5)\
>  \<. = Print a “/” (pos:4)\
>  \>… = Print 3x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 9\
> \
>  //START Line 10\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  »……. = Change to 5th place; print 7x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  \<……. = Print 7x “\_” (pos:2)\
>  \>. = Print a “|” (pos:3)\
>  \>. = Print a “/” (pos:4)\
>  \>…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  \>. = Print a “/” (pos:4)\
>  \>………. = Print 10x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  \<…. = Print 4x “\_” (pos:2)\
>  \>. = Print a “|” (pos:3)\
>  \>. = Print a “/” (pos:4)\
>  \>…. = Print 4x SPACE (pos:5)\
>  «. = Print a “|” (pos:3)\
>  »\>. = Print NewLine (pos:6)\
>  //END Line 10\
> \
>  //START Line 11\
>  «\<. = Change to 3rd place; print “|” (pos:3)\
>  »»[-] = Clean 7th place (pos:7)\
>  «««++++[»»»++++++++++«««-]»»»++++ = 44 in 7th place (times to repeat
> “\_”) Use as Counter place (pos:7)\
>  [««\<.»»\>-] = Print 44 times “\_” (pos:7)\
>  ««. = Change to 3rd place and print “|” (pos:3)\
>  //END Line 11

Brainfucked wishes

