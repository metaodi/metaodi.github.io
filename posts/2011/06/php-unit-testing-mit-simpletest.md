---
date: 2011-06-21
tags:
    - PHP
    - Unit Testing
    - Programming
title: PHP Unit Testing mit SimpleTest
---


![SimpleTest in action](http://media.tumblr.com/tumblr_ln5d7sf2901qa2z4q.png)

Seit letzter Woche habe ich [SimpleTest](http://www.simpletest.org/) im Einsatz und bin davon ziemlich begeistert. Das Framework bietet alles was man von einem konventionellen Unit-Testframework her kennt, wie diverse Assertion-Methoden oder Gruppierung von Testfällen zu [Testsuiten](http://www.simpletest.org/en/start-testing.html#group).

Daneben gibt es aber noch eine ganze Reihe von coolen Erweiterungen:

-   Es gibt einige vordefinierte Test-Reports, welche den Erfolg (oder Misserfolg) der Tests anzeigen. Wenn einem diese nicht genügend kann man diese (dank OO) ganz einfach erweitern. So habe ich meinen “persönlichen” Testreporter geschrieben, welcher mir neben den Details zu den Fehlern auch die Details zu den erfolgreichen Tests beschreibt (dazu muss man nur die Methode `paintPass()` überschreiben), das Resultat ist in obigem Bild ersichtlich.
-   Man kann auch sogenannte [Web-Tests](http://www.simpletest.org/en/web_tester_documentation.html) machen, d.h. man kann das Browserverhalten simulieren und so beispielweise automatisiert ein Formular ausfüllen und abschicken
    lassen, anschliessend dann das Ergebnis prüfen.
-   Das erzeugen von [Mock-Objekten](http://www.simpletest.org/en/mock_objects_documentation.html) ist kinderleicht, das Framework bietet eine einfache Methode um eine “leere” Hülle eines Objekts zu generieren (z.B. einer Datenbankverbindung) 

Das [Tutorial](http://www.simpletest.org/en/first_test_tutorial.html)
führt einem durch die ersten Schritte, die
[API](http://simpletest.org/api/) gibt den vollständigen Überblick.
Durch die verschiedenen Reporter kann das gleiche Skript auch gebraucht
werden um in einem automatisierten Build zu laufen, so wie man es z.B.
von JUnit kennt.

Ich habe momentan alle meine Testfiles in einem Verzeichnis und habe mir
deshalb ein simples Skript geschrieben, welche alle Tests ausführt:

[[Pastie-Link]](http://pastie.org/2101994)

Um jedes einzelne File jedoch immer noch separat ausführen zu können,
include ich `autorun.php` nur genau dann, wenn ich das File direkt
anspreche:

    if (count(get_included_files()) == 1) {
        require_once("includes/simpletest/autorun.php");
    }

Ich kann das Framework also nur empfehlen!

