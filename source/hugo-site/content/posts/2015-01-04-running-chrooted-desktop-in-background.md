+++
title = "Running Chrooted Desktop in Background"
author = ["Gordon Tillman"]
date = 2015-01-04
tags = ["ubuntu", "linux", "chromebook"]
draft = false
+++

I made a post yesterday that covered the steps required to install
Ubuntu on an ASUS C200 Chromebook.  One thing I noticed was that,
while you are running Ubuntu, it ties up your terminal window and
makes it unavailable for doing other tasks.

<!--more-->

According to some information that [I found here](https://github.com/dnschneid/crouton), you should be able to
accomplish this via a parameter supplied to the `startxfce4` command.
For example:

```text
startxfce4 -b
```

That didn't seem to work for me.  The command still ran in the foreground.
I found that just using the standard Unix/Linux way worked fine:

```sh
startxfce4 > /dev/null 2>&1 &
```

_Note:_  You cannot prefix this with `nohup` and close out the
terminal completely.  Doing so will exit the chroot environment and
terminate Ubuntu.  But at least you know have access to the
command-line in that terminal and you don't have to look at a bunch of
debug messages.

So far this Chromebook experiment is going very well. Lot's of fun!
