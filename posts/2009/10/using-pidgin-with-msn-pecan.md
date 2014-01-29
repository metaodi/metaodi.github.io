---
date: Fri Oct 23 2009 12:44:00 GMT+0200 (CEST)
tags: [MSN, Linux]
title: Using Pidgin with msn-pecan
---


Today when I was starting pidgin I could connect to ICQ, but when trying
to connect to MSN Pidgin comes up with:

    unable to retrieve MSN address book

So I was googeling a little bit and found a bug @ pidgin from yesterday.
The problem is not pidgin, although the official MSN client and some
others clients still work (e.g. meebo). There are several different
versions of the MSN protocol, pidgin is using MSNP15. And exactly this
protocol is currently not working on the server side @ Microsoft (as it
seems).

Other clients are not affected as they switch to older version of the
protocol, which are still working.

Because I don’t want to wait until MS fixed the problem, I use a quick
workaround. As an alternative you can install `msn-pecan`.

With Gentoo this works (after adding “x11-plugins/pidgin-msn-pecan
\~x86” to `/etc/portage/package.keywords`):

    # emerge pidgin-msn-pecan

After the installation just restart Pidgin go to “Accounts” -\> “Manage
Accounts”. Select your MSN-Account, click “Modify”. Choose “WLM” as
protocol. Save and reconnect your MSN account. Works like a charm!

