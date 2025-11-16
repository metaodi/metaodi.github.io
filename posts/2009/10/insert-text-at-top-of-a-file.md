---
id: 220906263
link: http://odi.tumblr.com/post/220906263/insert-text-at-top-of-a-file
slug: insert-text-at-top-of-a-file
date: Fri Oct 23 2009 15:20:00 GMT+0200 (CEST)
publish: 2009-10-023
categories: [Linux]
title: Insert text at top of a file
---


If you want to insert text at the end of a file (“append”) you can
simply use:

     $ echo "test" >> my_file.txt

which then adds “test” on a new line at the end of the “my\_file.txt”.
In my case I had to insert text at top of a file. If you start to google
for that you discover quite fancy solution like using vi or some sed
magic.

For me this was all too much. I have a file with quite static text in
it. At the end of a shell script I want to insert the content of this
file at the beginning of a logfile created by the script.

When using files it’s getting easier:

     $ cat my_static_file.txt logfile.txt > temp_logfile.txt 
     $ mv temp_logfile.txt logfile.txt

But my script can run parallel and therefore this approach is very
dangerous. I was looking for a quick solution and came up with this:

     $ cat my_static_file.txt logfile.txt > $$ && mv $$ logfile.txt

This has the advantage of being on a single line and using “\$\$” as
filename. \$\$ is the process ID (PID) of the current running script,
and therefore cannot exist twice at the same time.

Because of the usage of && and calling everything on one line is, that
the following command is only executed when the predecessor command
finished successfully. Otherwise the whole command quits. In my case
this means the logfile will be kept and not moved.

