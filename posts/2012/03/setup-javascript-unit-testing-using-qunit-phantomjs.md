---
id: 18940470535
link: http://odi.tumblr.com/post/18940470535/setup-javascript-unit-testing-using-qunit-phantomjs
slug: setup-javascript-unit-testing-using-qunit-phantomjs
date: Thu Mar 08 2012 08:24:00 GMT+0100 (CET)
publish: 2012-03-08
tags: JavaScript, Unit Testing, Programming, QUnit, Jenkins, PhantomJS, Amazon EC2
title: Setup JavaScript unit testing using QUnit, PhantomJS and Jenkins on Amazon EC2
---


Me and my friend are currently working on a term paper about [Google
Fusion Tables](https://developers.google.com/fusiontables/). It’s about
it’s possibilities and potential. Our goal is to create a cross-platform
mobile application using [Sencha
Touch](http://www.sencha.com/products/touch), therefore we need to write
a lot of JavaScript code for the UI and to access the Google Fusion
Tables. Fortunately Google provides an [inofficial JSONP
API](https://groups.google.com/forum/#!topic/fusion-tables-users-group/TGDzExKymoI/discussion),
so we get native JavaScript access without another server roundtrip
(there is [a good blog
post](http://www.reddmetrics.com/2011/08/10/fusion-tables-javascript-query-maps.html)
explaining the usage with jQuery).

The next question is: if we write tons of code in JavaScript, how are we
going to unit test this code. We already used
[QUnit](http://docs.jquery.com/QUnit) in a former project and it’s
fairly easy to use, so we decided to use that. This all works very well,
you get a [nice web page where all your tests
run](http://gft.rdmr.ch/test/js) in the browser and you get nice output,
everything’s fine.

![Browser output of
QUnit](http://media.tumblr.com/tumblr_m0ivihw8Rb1qa2z4q.png "Browser output of QUnit")

But, wait! What about our build? We use [Jenkins
CI](http://jenkins-ci.org/), which is configured to [build our project
every time we push new code to
GitHub](https://wiki.jenkins-ci.org/display/JENKINS/Github+Plugin).
Wouldn’t it be nice if our tests run when we build, so we get immediate
feedback and never ever forget to run them and fix our code?

Yes, it definitely would be!

Now we have several problems

-   How do I run JavaScript without a browser?
-   Does Jenkins “speak” JavaScript?
-   Is there a solution for ant? Do I need another tool? Another server?
-   How do I get my test results as XML, so Jenkins can handle them?

I checked serveral solutions to my this problems: From
[node.js](http://nodejs.org/) to [Rhino](http://www.mozilla.org/rhino/)
(there is even an [ant based unit testing
framework](http://code.google.com/p/rhinounit/) using Rhino) to
[TestSwarm](http://swarm.jquery.org/). They were all too limited or too
bloated. I couldn’t believe this is such a big deal to run QUnit
JavaScript code, get the results and publish them in Jenkins.

This is when I found out about [PhantomJS](http://www.phantomjs.org/), a
nice and handy headless WebKit browser, that runs JavaScript code.
Exactly what I need. As we are using [Amazon
EC2](http://aws.amazon.com/ec2/) for this project, I tried to install
PhantomJS on a basic Amazon AMI. I just couldn’t get it to work, when I
asked in Twitter if someone succeeded to setup PhantomJS. [Philipp Küng
pointed
out](https://twitter.com/#!/philippkueng/status/176606716492914688)
(thanks again!) that it is much easier to setup with Ubuntu. Well then,
launch a new Instance on EC2, choose the [latest Ubuntu
AMI](http://cloud.ubuntu.com/ami/), and after some simple commands
you’re good to go:

    sudo add-apt-repository ppa:jerome-etienne/neoip
    sudo apt-get update
    sudo apt-get install phantomjs

After that I had to [setup Xvfb (virutal
framebuffer)](http://code.google.com/p/phantomjs/wiki/XvfbSetup),
because EC2 instances are headless. Generally see the [PhantomJS
Wiki](http://code.google.com/p/phantomjs/wiki/PhantomJS) for further
information.

Now I have a PhantomJS instance, the published QUnit tests and Jenkins.
To be able to retrieve the data from PhantomJS I created a simple PHP
script, which runs on the new instance and just executes a shell command
(idea from [this blog
post](http://cisight.com/run-latest-phantomjs-with-shell_exec-php-on-ubuntu-11-10-oneiric/)).

    <?php
    /* Display 99 is configured on the server using Xvfb */
    $value = shell_exec("DISPLAY=:99 phantomjs run_qunit.js http://gft.rdmr.ch/test/js/index.html junit-xml");
    echo $value;
    ?>

With this URL I was able to create a simple ant target, which fetches
the latest results from the tests:

    <target name="test-js" depends="deploy">
        <get src="${test.url}" dest="${result.dir}/${result.js.file}"/>
    </target>

Where `${test.url}` referes to my PHP script, and `${result.dir}` is
configured as the location of JUnit reports in Jenkins (see screenshot):

![Jenkins job configuration for JUnit XML
reports](http://media.tumblr.com/tumblr_m0jhgm87wz1qa2z4q.png "Jenkins job configuration for JUnit XML reports")

Now the last missing piece is to get proper output for Jenkins. I
adapted the [QUnit test
runner](https://github.com/ariya/phantomjs/blob/1.2/examples/run-qunit.js)
from the PhantomJS examples accordingly (called `run_qunit.js`, see
above, here is [my
version](https://github.com/odi86/GFTPrototype/blob/master/test/js/run_qunit.js)).
I added a new command line parameter `type`, which determines the type
of output the runner generates. With the value `junit-xml`, the output
can directly be used by Jenkins, this is the reason for the junit-xml
parameter in the PHP script above.

The generated XML looks like that:

    <?xml version="1.0"?>
    ---
     Tests completed in 2294 milliseconds.
    36 tests of 36 passed, 0 failed. 
    ---
    <testsuite name="QUnit - JavaScript Tests" timestamp="2012-03-08T00:11:27Z" tests="36" failures="0" time="2.294">
    <testcase name="PaintSwitzerland" classname="GoogleFusionTable">
    </testcase>
    <testcase name="Construtor" classname="GftLib">
    </testcase>
    <testcase name="Constants" classname="GftLib">
    </testcase>
    <testcase name="doGet" classname="GftLib">
    </testcase>
    <testcase name="doPost" classname="GftLib">
    </testcase>
    <testcase name="doGetJSONP" classname="GftLib">
    </testcase>
    <testcase name="doPostJSONP" classname="GftLib">
    </testcase>
    <testcase name="ExecSelect" classname="GftLib">
    </testcase>
    </testsuite>

And in Jenkins like that: ![Test trend with failed/successful tests over
time](http://media.tumblr.com/tumblr_m0ji3zihxl1qa2z4q.png "Test trend with failed/successful tests over time")

Overview of tests: ![Overview of all performed
tests](http://media.tumblr.com/tumblr_m0ji5dTeGL1qa2z4q.png "Overview of all performed tests")

Failed test: ![Detail of a failed test incl.
'stacktrace'](http://media.tumblr.com/tumblr_m0jie0S4WY1qa2z4q.png "Detail of a failed test incl. 'stacktrace'")

