---
date: Wed Nov 03 2010 07:43:00 GMT+0100 (CET)
tags:
    - PHP
    - Programming
    - Developers Shame Day
title: "Developers Shame Day: BB-Code selbstgemacht"
---


![Developers Shame Day](http://media.tumblr.com/tumblr_lb5krblZFn1qa2z4q.png)

Via Twitter (weiss leider nicht mehr wer das geschrieben hat) bin ich
[auf einen Artikel vom php hacker](http://phphacker.net/2010/10/26/der-developers-shame-day/)
gestossen, wo er dazu aufruft heute am “Developers Shame Day”
mitzumachen und alte Codeschnippsel von sich zu posten: Beispiele von
schlechtem Code für die man sich heute schämen sollte.

Einserseits um zu zeigen, dass jeder mal angefangen hat schlechten Code
zu schreiben und allgemein sich einzugestehen, dass Fehler nun mal
passieren und man selbst und vielleicht sogar andere davon profititieren
können. Da mach ich gerne mit.

Das Stück Code das ich vorstellen möchte ist PHP-Code, welcher auf einer
meiner alten Pages gelaufen ist. Jeder kennt ja die BB-Codes um Artikel
oder Kommentare mit Formattierungsinformationen anzureichern. Ich habe
meinen eigenen “Parser” dafür geschrieben, welcher die Codes in
entsprechendes HTML umgewandelt hat.

Hier ein Auszug: [Pastie-Link](http://pastie.org/1261848)

Die Idee dahinter war einfach, es gibt 2 Arten von Codes:

-   ohne Parameter wie z.B. Bold, also `[b]fetter Text[/b]`
-   mit Parametern wie z.B. URL, also `[url=http://www.readmore.ch]Meine Webpage[/url]`

Die parametrierbaren Codes erhielten im Anfangsarray den Text
`“!!REPLACER!!”` welche dann anschliessend ersetzt wurde. Das mag ja alles
noch gehen, wenn auch sich solche ein Parser mit Regular Expression um
einiges schöner schreiben liess.

Wirklich *stolz* bin ich auf Zuweisungen à la `“s” =\> “\<s\>”`, `“h1” =\> “\<h1\>”`, wo sich mir heute die Nackenhaare aufstellen. 
Typisch war auch die schlechte Namensgebung der Variablen (anz oder sub/newsub) sowie die auskommentierten Stellen (“man weiss nie für was das mal noch gut sein
kann”).

