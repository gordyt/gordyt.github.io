+++
title = "Installing Ubuntu 14.04 LTS with i3 Window Manager on Chromebook"
author = ["Gordon Tillman"]
date = 2015-01-09
tags = ["ubuntu", "chromebook"]
draft = false
+++

In this post I document the steps required to install and configure
Ubuntu 14.04 LTS (Trusty Tahr) on an ASUS C200MA-EDU-4GB Chromebook.

<!--more-->

I'm going to assume that you have already downloaded [Crouton](https://github.com/dnschneid/crouton).


## Install the base system {#install-the-base-system}

-   Hit `Ctrl+Alt+t` to start a _crosh_ shell
-   Enter `shell` to start a proper shell.
-   Enter `cd Downloads`
-   Install the base system by entering
    ```sh
    ~sudo sh -e ./crouton -r trusty -t x11,extension -n trusty-i3
    ```

    -   Follow the directions


## Install the window manager {#install-the-window-manager}

-   `sudo enter-chroot -n trusty-i3`
-   `sudo apt-get install i3`
    -   allow it to create a default configuration file


## Install a decent terminal {#install-a-decent-terminal}

-   `sudo apt-get install gnome-terminal`


## Install the Adobe Source Code Pro Fonts {#install-the-adobe-source-code-pro-fonts}

I love these fonts!

-   Navigate to Adobe's github download page [here](https://github.com/adobe-fonts/source-code-pro/releases/).
-   Download the tar.gz format
-   Assuming that your chroot is running....
    -   From the ChromeOS side do `Ctrl+Alt+t` to open a terminal
    -   Enter `shell`, then `cd ~/Downloads`
    -   Untar the archive.  For me it was: `tar xfz source-code-pro-1.017R.tar.gz`
    -   CD into the extracted archive's OTF directory: `cd source-code-pro-1.017R/OTF`
    -   Copy the fonts over to the chroot.  For me this was:
        ```sh
        sudo cp * /usr/local/chroots/trusty-i3/usr/share/fonts/opentype/
        ```


## Set i3 to start automatically when you startx {#set-i3-to-start-automatically-when-you-startx}

Do this from in your chroot.

```sh
echo "exec i3" > ~/.xinitrc
```


## Make an easy alias for starting your windowing system {#make-an-easy-alias-for-starting-your-windowing-system}

-   Exit out of the chroot
-   From inside your `crosh/shell`:
    -   Edit `$HOME/.bashrc`
    -   Add this alias:
        ```text
        alias starti3='sudo enter-chroot -n trusty-i3 xinit'
        ```


## Tweak a couple of i3 settings {#tweak-a-couple-of-i3-settings}

Back in the chroot, edit the file `$HOME/.i3/config`

-   Use the Search key as your i3 mod key
    ```text
    set $mod Mod4
    ```
-   Use Adobe's Source Code Pro font as your default font
    ```text
    font pango:Source Code Pro 12
    ```


## References {#references}

-   [The Crouton Homepage](https://github.com/dnschneid/crouton)
-   [Using i3 in crouton](https://github.com/dnschneid/crouton/wiki/i3)
-   [i3 - improved tiling wm](https://i3wm.org/)


## Tips {#tips}

-   Audio from the chroot will now be forwarded to CRAS (Chromium OS
    audio server).
-   To switch from chroot to ChromeOS: `Ctrl-Alt-Shift-Forward`
-   To switch from ChromeOS back to chroot: `Ctrl-Alt-Forward` then
    `Ctrl-Alt-Refresh`
