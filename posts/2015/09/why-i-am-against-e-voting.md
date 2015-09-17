---
date: 17.09.2015
tags: [Politics, E-Voting]
title: Why I'm against E-Voting
---

In Switzerland we'll have the national elections coming up on the 18th October 2015.
It's again that time where the voices are getting louder.
Especially in those moments, but actually before every political vote in Switzerland (which happens several times a year), there seems to be a rising interest in the subject of E-Voting.

As I work in IT, people ofter assume I'm waiting for that moment, when it's finally allowed to do that (actually there are two cantons that have the permission, but I don't live in one of those).
But actually it's the opposite.
And probably it's because _I work in IT_.
I had this conversation already several times, so I though it's time to write down my main arguments for the most common objections.

Feel free to correct me :)

### I can haz vote on my smartphone on my way to work?

Democracy is hard. It's not designed to be _easy_, and "Voting" is the crucial core of democracy.
Voting is a public act, that must be accountable, while remaining each persons voting secrecy.
And to achieve that we already have a perfect system in place: you can either vote in person or send the ballot by mail.

It's not that hard, but it takes some time.
We're not talking about a Facebook "Like" click or a Tinder "Hot or Not" swipe, we're talking about our polical rights and our duty as citizens to not easily give up the power we have. 

### E-Voting will increase the participation in the elections, especially the young will vote if there would be E-Voting

Bullshit! If someone doesn't care about voting, they will not start doing so if they get another channel.
Even the [Federal Chancellery](https://www.bk.admin.ch/themen/pore/evoting/07977/index.html?lang=en) had to admit that the participations didn't increase in their tests (see also [here](http://www.bernerzeitung.ch/schweiz/standard/einheimische-sollen-per-evoting-waehlen-koennen/story/30409508), [here](http://www.blick.ch/news/politik/junge-bleiben-stimmfaul-keine-hoehere-wahlbeteiligung-mit-e-voting-id4007174.html) and [here](http://www.inside-it.ch/articles/40863))

### E-Banking is secure, why should E-Voting be less secure?

First of all: E-Banking is not secure. They try their best to make it so, but there are so many possibilities to overcome a system, it's impossible to say one of these systems is secure.
But the banks are willing to take the risk.
This is up to them, and I myself am a happy E-Banking user.

I do this with the knowledge, that if something goes wrong, it can be fixed.
Or if I lose money due to my own stupidity, so be it.
I'm willing to take this risk as well.

But all this does not apply to a core element of democracy.
There is no one that covers for a fraudulent election.
The risks that are inherent to using computers are simply not acceptable.

Fraud is also possible in the classic voting system.
You could count wrong.
Or enter the wrong number when transfering it the next department.
But E-Voting would make it possible to commit systematic fraud.

All you had to do, is to attack a single point.
If you can change the software, you might be able to count differently.
Or you could do a [Denial-of-Service](https://de.wikipedia.org/wiki/Denial_of_Service) attack and prevent people from voting online.

### The software they use is security-audited and state-of-the-art

Yes, I'm sure about that.
But that doesn't change a thing.
This simply states, that it's hard to do, but not impossible.
Plus we can't be sure that the auditors catch everything.
Of course a good way to avoid or mitigate this kind of problem is to use open source software.
I must be able to read it's source code.
So we can stop talking about all those closed-source solutions, where we'll never be able to tell if it's doing what it should be doing.
The consequence of this would be, that only people that can code, can verify the E-Voting system, where the current (paper-based) system, is immediately clear for everybody.

There is a famous competition called ["Underhanded C"](http://www.underhanded-c.org/).
The goal is to write innocent-looking code, that passes visual inspection, but has a harmful side-effect.
So it's definitely possible to do.
It's only a matter of time.

But let's assume for a moment, that this perfect piece of software exists, and it has been audited and it works and does no evil.
We still have a problem: there is no way of telling what code currently runs on a computer.
So maybe the software has been replaced between the review and the runtime.
Or it could have been changed at runtime.
We simply cannot say.
If we could, we would have solved the [Halting problem](https://en.wikipedia.org/wiki/Halting_problem).

We as a society have to decide if we're willing to take the risk, that the E-Voting system might get hacked.
That it might be broken.
That it might have been compromised.
The answer for me is clear: it's broken by design, and it's way too important to take chances here.

### Let's keep the current system

The current system is not broken.
Why should be replace it with a broken one?
The current system allows us to watch the voting process.
We can see the ballots, we can count them.

By hiding that inside a computer, there is nothing we can watch.
We can only trust in the system.
It's way to important to just leave it like that.

That said, I'm always open to discuss alternatives.
Maybe there comes a time, where we discover something fundamental new, that it'll be possible.
But this new thing is not just a new algorithm.
If it's based on the same principles as I've written above, it is not accepable for a democracy.
