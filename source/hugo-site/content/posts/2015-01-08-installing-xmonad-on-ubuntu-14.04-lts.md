+++
title = "Installing xmonad on Ubuntu 14.04 LTS"
author = ["Gordon Tillman"]
date = 2015-01-08
tags = ["ubuntu"]
draft = false
+++

After seeing with my own eyes how rapidly the very minimal the [xmonad
windowing manager](http://xmonad.org/) starts up after logging in, I decided to upgrade an
old Linux box I have at the office that is running Ubuntu 14.04 LTS
(Trusy Tahr).

<!--more-->


## David Brewer's Easy Installation {#david-brewer-s-easy-installation}

David Brewer's [xmonad-ubuntu-conf](https://github.com/davidbrewer/xmonad-ubuntu-conf) is really well-documented and it is
what my buddy at work based his setup on.  I started by forking
David's repository so that I could maintain serveral branches online
(one for each Linux box I install xmonad on).

After that, you just clone the repository out to `$HOME/.xmonad` and
run this command:

```sh
~/.xmonad/install-xmonad
```


## Keyboard Tweaks {#keyboard-tweaks}

I'm using a really nice and solid [IBM Model M Keyboard](http://www.pckeyboard.com/) for my Linux
box.  It has no _Super_ key and you _really_ need one with xmonad.

I wanted to remap my _Alt_ key on the right-hand side of the spacebar
as the _Super_ key.  I found instructions [here](http://askubuntu.com/questions/70931/how-to-set-right-alt-to-work-as-a-winsuper-key):

Basically just edit `$HOME/.Xmodmap` (you may not already have this
file) and add the following:

```text
! Free up Right-Alt for remapping
remove mod1 = Alt_R

! Remap Right-Alt to Super
clear mod4
keycode 108 = Super_R
add mod4 = Super_R
```

Then just log out and back in again.


## Desktop Backgrounds {#desktop-backgrounds}

This involves two steps.  The first it to select and save them, the
second is restore when you log in.  The _nitrogen_ command is used to
do both.


### Selecting and Saving {#selecting-and-saving}

Start _nitrogen_ as follows:

```sh
nitrogen --save <path-to-pictures-directory>
```

Select the picture or pictures (if you have multiple desktops) that
you want.  Then exit the program.


### Restoring Desktop when you Log in {#restoring-desktop-when-you-log-in}

Edit the file `$HOME/.xinitrc` (it may not already exist).

Add the following:

```text
nitrogen --restore &
```


## Fixing the stalonetray with Dual Monitors {#fixing-the-stalonetray-with-dual-monitors}

The _stalonetray_ goes in the upper-right corner of the window.  On my
machine, with dual monitors, all my menu-bar stuff _except_ for that
was on the left monitor.  The _stalonetray_ was at the upper-right
corner of the right monitor and there was a little gray box in the
upper-right corner if the left monitor where it should have been.

Fixing this is easy.  First, determine the number of x-pixels in your
monitors.  I found this out by running the _Displays_ app.  My
monitors are `1680x1050`.

Now edit the file `$HOME/.xmonad/start-xmonad`.  Search for
"stalonetray".  Edit the `--geometry` setting.

Mine `--geometry` setting had this value originally:

```text
--geometry 5x1-0+0
```

I changed it to ths:

```text
--geometry 5x1-1680+0
```

Restart _xmonad_ and you are good to go.


## xmonad default bindings {#xmonad-default-bindings}

Print out [this PNG file](https://www.haskell.org/haskellwiki/File:Xmbindings.png).
