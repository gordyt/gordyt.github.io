+++
title = "Using a Chromebook as a Development Machine"
author = ["Gordon Tillman"]
date = 2015-01-03
tags = ["chromebook", "linux", "ubuntu"]
draft = false
+++

## Introduction {#introduction}

I have been interested in seeing if would be possible to set-up a
[Chromebook](https://www.google.com/chrome/devices/) so that some serious development work with it.  It's a
given that you won't be running any virtual machines on a Chromebook.
But at this point I think you can do pretty much any thing else you
might need to do.

<!--more-->


## A Minimal Chromebook {#a-minimal-chromebook}

First of all, let me say that I think that you need, at a minimum, a
Chromebook that has 4GB of RAM and 32GB of local storage.  I decided
on the [ASUS model C200MA-EDU-4GB](http://smile.amazon.com/gp/product/B00KGI4XBI).  This machine is very inexpensive,
has a decent display and keyboard, and meets my minimum RAM/storage
requirements.


## Options {#options}

As I see it, there are at least two options you can choose that will
let you use a Chromebook as a serious development machine.  I have
tried both of these and am now using a combination of the two.

The first option is to use a basically stock Chromebook in conjunction
with an inexpensive Virtual Private Server (VPS).  For this to be a
viable option you must be doing your work someplace where you have a
decent Internet connection.

You rent a VPS, install a nice Linux. I like Ubuntu 14.04 LTS (Trusty
Tahr).  You install all of your tools there and use the Chromebook as
a portable terminal that lets you access these tools.

But what if you want the option of doing useful work from anywhere,
whether or not you have a good Internet connection? In that case, we
take a look at the second option.

The second option is to enable developer mode on your Chromebook,
install Linux in a chroot environment along with whatever tools you
need, and work in ChromeOS or your chroot environment as needed.

This turns out to be extremely easy to accomplish.  The remainder of
this post will cover the steps I followed to get this going.


## Enabling dev mode {#enabling-dev-mode}

The exact procedure required to enable dev mode will vary from one
Chromebook to another.  For an ASUS C200 it is extremely simple.

1.  Tap the power button while pressing and holding the _esc_ and
    _refresh_ buttons.  Note that the _refresh_ button is on the top
    row of keys and looks like a circular arrow.
2.  The Chromebook will reboot and you will see a screen that tells you
    that Chrome OS is missing or damaged.  Just hit `ctrl-d` and then
    _enter_ to continue.
3.  The computer will restart and you will see a screen that tells you
    OS verification is off.  Hit `ctrl-d` to continue.
4.  Go take a break while your Chromebook's data is reset.  I didn't
    pay attention to how long it took, but you will get a textual
    progress bar at the top of the window while this is in progress.
5.  When it finally comes back up just connect to your wireless network
    and log-in as normal.

**Note:** From this point on you will always see the verification screen
when you restart.  No worries, just hit `ctrl-d` to proceed.


## Installing the Crouton Integration Chrome extension {#installing-the-crouton-integration-chrome-extension}

This is pretty cool.  It lets you run your Linux windowing manager in
a Chrome frame that shows up on your dock at the bottom of the
screen.  Let's go ahead and install it now so that it will be in place
when your Ubuntu installation has finished.

-   From Chrome, navigate [to this URL](https://chrome.google.com/webstore/detail/crouton-integration/gcpneefbbnfalgjniomfjknbcgkbijom) and install the extension.  That's
    it!


## Installing Ubuntu via Crouton {#installing-ubuntu-via-crouton}

Crouton stands for _Chromium OS Universal Chroot Environment_.  It is
a very nice shell script that greatly simplifies the process of
installing and running your Linux environment on the Chromebook.

-   [Click here](https://goo.gl/fd3zc) from Chrome to download the latest version of the script.
-   Pull up a terminal window as follows:
    -   Hit `ctrl+alt+t`
    -   Type `shell` and hit _enter_.
    -   Type `cd ~/Downloads` and hit _enter_.
    -   If you then enter `ls` you should see the Crouton script you just
        downloaded.

The instructions that follow assume that you want to install Ubuntu
14.04 LTS using the `xfce` window manager.

-   Type `sudo sh -e ./crouton -r trusty -t xfce,xiwi` and hit _enter_.
-   After everything is installed you will be asked to enter a username
    and password.


## Running Ubuntu {#running-ubuntu}

Here is the basic procedure for entering your chroot environment and
starting your Ubuntu environment.

-   If necessary, get a terminal session going.  Remember the steps to
    do this?
    -   Hit `ctrl+alt+t`
    -   Type `shell` and hit _enter_.
-   Enter the chroot environment by typing `sudo enter-chroot` and
    hitting _enter_.
-   Start up the Ubuntu UI by typing `startxfce4` and hitting _enter_.
-   As a shortcut you can do the following:
    -   Pull up a terminal session
    -   Types `sudo startxfce4` and hit _enter_.

By default this will start up the Ubuntu windowing system in full
screen mode.  To toggle full-screen mode just hit what would be the F4
button on the top row of the keyboard.  On my ASUS this button looks
like a rectangle with little arrow-heads in the top-left and
bottom-right corners.  Google calls this _immersive mode_.


## Enable Verified Boot and Auto Updates {#enable-verified-boot-and-auto-updates}

This tip came from [here](https://sites.google.com/site/chromeoswikisite/home/what-s-new-in-dev-and-beta/shell-acess-with-verified-boot).  Enabling developer mode will disable
verified boot by default.  To fix it, just do the following:

-   Open a shell and become root
    ```sh
    Control-Alt-T
    shell
    sudo su -
    ```
-   If you have not already done so, set a password for the _root_ user
    by entering the following command and following the prompts:
    ```sh
    chromeos-setdevpasswd
    ```
-   Enable verified boot from the root shell:
    ```sh
    crossystem dev_boot_usb=0 dev_boot_signed_only=1
    ```

Please see the [original post](https://sites.google.com/site/chromeoswikisite/home/what-s-new-in-dev-and-beta/shell-acess-with-verified-boot) for more information and some screen shots.


## References {#references}

These are some of the sites I read through when setting up the
Chromebook:

-   [Shell Access With Verified Boot And Auto Updates](https://sites.google.com/site/chromeoswikisite/home/what-s-new-in-dev-and-beta/shell-acess-with-verified-boot)
-   [Asus C200 Chromebook: Enabling dev mode, installing Ubuntu](http://liliputing.com/2014/06/asus-c200-chromebook-enabling-dev-mode-installing-ubuntu.html)
-   [How to Install Ubuntu Linux on Your Chromebook with Crouton](http://www.howtogeek.com/162120/how-to-install-ubuntu-linux-on-your-chromebook-with-crouton/)
-   [David Schneider's Crouton GitHub Page](https://github.com/dnschneid/crouton)
-   [David Schneider on Security](https://github.com/dnschneid/crouton/wiki/Security)
-   [The Chrome OS Wiki](https://sites.google.com/site/chromeoswikisite/home)
-   [Tom Wolf's Crouton Cookboook](http://tomwwolf.com/chromebook-14-compedium/chromebook-crouton-cookbook/)
-   [François Beaufort's Google+ Profile Page](https://plus.google.com/u/0/%2BFrancoisBeaufort/posts/JDVkXALPcNq)
-   [Fuyuko Gratton's Basic Tweaks and Tips for Crouton in Chromebook](http://fuyuko.net/basic-tweaks-and-tips-for-crouton-in-chromebook/)
-   [Crouton Ubuntu running in a browser tab of a Chromebook](http://www.postslush.com/2014/12/crouton-ubuntu-running-in-browser-tab.html)
-   [Google's Supported file types and external devices](https://support.google.com/chromebook/answer/183093?hl%3Den)
-   [Google's Chromebook Keyboard Features](https://support.google.com/chromebook/answer/1047364?hl%3Den)
-   [vpsdime](http://vpsdime.com/) - Where my VPS lives
