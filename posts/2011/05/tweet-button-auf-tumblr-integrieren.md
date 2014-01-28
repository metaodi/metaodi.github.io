---
id: 5613694550
link: http://odi.tumblr.com/post/5613694550/tweet-button-auf-tumblr-integrieren
slug: tweet-button-auf-tumblr-integrieren
date: Wed May 18 2011 22:06:00 GMT+0200 (CEST)
publish: 2011-05-018
tags: Twitter, Tumblr
title: Tweet Button auf Tumblr integrieren
---


Ich habe vor einiger Zeit in der Sidebar den Tweet Button eingefügt (da
wo er so richtig neu war) und habe bemerkt, dass dort schlicht die
aktuelle URL mitgegeben wird und diese dann im Tweet erscheint.

Als ich mich heute nochmals kurz damit beschäftigt und die [offizielle
“Tweet Button” Seite](https://twitter.com/about/resources/tweetbutton)
besucht habe, habe dort gesehen, dass man durchaus dem Ding eine URL und
einen Text mitgeben kann. Dank den [Theme-Platzhaltern von
Tumblr](http://www.tumblr.com/docs/en/custom_themes) lässt sich somit
der Button sehr leicht zu jedem Beitrag hinzufügen (in diesem Fall
**`{Permalink}`** für die aktuelle Seite und **`{Title}`** für den
Beitragstitel) .

Ich habe folgendes in mein Theme eingefügt:

    <div id="tweetbutton">
    --- Start Tweet Button ---
    <a href="http://twitter.com/share" class="twitter-share-button" 
    data-count="horizontal" data-url="{Permalink}" data-text="{Title} (ReadMore.ch)"
    data-via="odi">Tweet</a>
    <script type="text/javascript" src="http://platform.twitter.com/widgets.js"></script>
    --- END Tweet Button ---
    </div>

