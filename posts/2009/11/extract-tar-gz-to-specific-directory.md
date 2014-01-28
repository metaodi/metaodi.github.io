---
date: Mon Nov 09 2009 15:22:00 GMT+0100 (CET)
tags: Linux
title: Extract .tar.gz to specific directory
---


I want to extract all files form a “.tar.gz” file to a specific
directory (not the current).

When you ask Google you quickly come up with the elegant solution:

    $ gzip -cd /some/dir/something.tar.gz | tar -xvf - -C /specific/directory

Somehow my development machine doesn’t accept this, as I keep getting
the error:

    File -C not present in the archive.
    File /specific/directory not present in the archive.

I couldn’t find the answer, but as usual many ways lead to Rome. I’m
able to extract the files to the current directory using

    $ gzip -cd /some/dir/something.tar.gz | tar -xvf -

Therefore I can simply change the current directory to my specific
directory and after the extraction return to the prior directory (I need
to unzip the file in a script, therefore I need a generic approach).
When we put all that together the following finally works:

    $ cd /specific/directory && gzip -cd /some/dir/something.tar.gz | tar -xvf - && cd -

