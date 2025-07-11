+++
title = "Fixing Scrolling on ASUS C200MA-EDU-4GB"
author = ["Gordon Tillman"]
date = 2015-01-04
tags = ["chromebook"]
draft = false
+++

One thing that really bugged me with my new ASUS C22MA Chromebook was
the way that track-pad scrolling worked.  By default it is exactly the
opposite of my MacBook Pro.

<!--more-->

Google [documents the way to change this](https://support.google.com/chromebook/answer/2583287?hl%3Den), but that was not working on
my Chromebook because when I went to the _Device_ section of the
_Settings_ because it indicated that no trackpad was found.

As it turns out, the fix is pretty simple.  I just switched from the
_stable_ channel to the _beta_ channel.  After the update completed
all was fine.

Switching channels is easy:

-   Click on the status area in the lower-right corner of the screen.
-   Select _Settings_
-   Click the _About ChromeOS_ link in the upper-right corner of the
    _Settings_ window.
-   Click the _More info..._ link just below the button labeled _Check
    for and apply updates_.
-   Click on the _Change channel..._ button and follow the directions.
