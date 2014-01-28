---
date: 25.06.2011
tags: 
    - HTML
    - JavaScript
    - Programming
title: Zum selektierten Wert springen (IE Bug)
---


Der Internet Explorer hat die Angewohnheit in einer `<select>`-Box den
ausgewählten Wert nicht direkt anzuzeigen. Stattdessen werden immer nur
die ersten Werte angezeigt. Der IE zeigt also folgendes:

![Der ausgewählte Wert ist nicht
sichtbar](http://media.tumblr.com/tumblr_lncuiemzXt1qa2z4q.png "Der ausgewählte Wert ist nicht sichtbar")

Wobei ich eigentlich folgendes erwarten würde:

![Der ausgewählte Wert ist als solcher
erkennbar](http://media.tumblr.com/tumblr_lncujzRQP21qa2z4q.png "Der ausgewählte Wert ist als solcher erkennbar")

Wenn der Benutzer scrollt, sieht er schon welcher Wert gewählt ist, die
Liste springt jedoch nicht automatisch zum ersten ausgewählten Wert (wie
das beispielsweise der Firefox macht).

Mit einer kleinen JavaScript-Funktion kann dies aber einfach nachgebaut
werden, die Funktion erwartet den Namen der `<select>`-Box als
Parameter, eine analoge Funktion für die ID lässt sich sehr einfach
bauen:

[[Pastie-Link]](http://pastie.org/2121185)

Offenbar reagiert der IE auf dynamisch gesetzte Selektionen, warum er
das nicht von sich aus macht, ist mir schleierhaft. Am einfachsten ist
es wenn das Script beim laden der Seite aufgerufen wird:

    <body onload="jumpToSelectedOptions(pizzaList);">

Evtl. ist das ja jemand anderem auch noch nützlich. Ich verwende die
Funktion bei einer Auswahlliste die eine Mehrfachauswahl zulässt, dank
dem “`break`" springt die Funktion einfach zum ersten gewählten Wert.

