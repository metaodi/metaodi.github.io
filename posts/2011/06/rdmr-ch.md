---
date: 2011-06-06
tags:
    - URL shortener
    - YOURLS
title: Eigener URL shortener (rdmr.ch)
---


Ich wollte schon immer einen eigenen [URL
shortener](http://de.wikipedia.org/wiki/Kurz-URL-Dienst) und das hat
verschiedene Gründe, liegt aber vor allem daran, dass ich keine Lust
habe, dass irgendwann der Anbieter meines Vertrauens sein Angebot
einstellt, plötzlich ein kostenpflichtiger Dienst wird oder mit anderen
Nettigkeiten aufwartet. Ursprünglich auf das Thema aufmerksam wurde ich
durch einen [Artikel auf
Lifehacker.com](http://lifehacker.com/5335216/make-your-own-url-shortening-service).

Deshalb habe ich mir schon vor einiger Zeit die Domain
[rdmr.ch](http://rdmr.ch) gesichert, jetzt bin ich auch endlich dazu
gekommen den Dienst aufzusetzen. Ich habe die Software
[YOURLS](http://yourls.org/) verwendet, das Ding ist kinderleicht zu
installieren, alles was man benötigt ist etwas Platz auf einem Server
und eine MySQL-DB. Die ganze Installation und Konfiguration dauert ca.
10min.

Ich habe mich bewusst dazu entschieden einen privaten URL shortener zu
erstellen, da ich keine Lust habe mich um allfällige SPAM-Links und
dergleichen zu kümmern und ich so die volle Kontrolle über alle URLs
behalte. YOURLS ermöglicht es aber zum einen, einen öffentlichen Dienst
anzubieten und zum anderen kann man via API den Dienst bequem in andere
Applikationen einbauen.

