+++
title = "Building Emacs 24.4 on Ubuntu 14.04"
author = ["Gordon Tillman"]
date = 2015-01-01
tags = ["ubuntu", "emacs"]
draft = false
+++

I recently signed up for a Virtual Private Server (VPS) with [vpsdime](https://vpsdime.com).
The idea is to set-up a complete development environment for all of my
work and personal projects that I can access from a low-end device
like a [Chromebook](https://www.google.com/chrome/devices/) or an [iPad](https://www.apple.com/ipad/) (with a suitable SSH app installed).

<!--more-->

I opted for the _High RAM VPS_, which has the following
specifications:

-   6 GB RAM
-   4 CPUs
-   30GB Storage
-   2TB/month traffic
-   10 Gb connection

It is very reasonably priced at only $7.00/month.  I had it spun up
with Ubuntu 14.04 LTS.

My first requirements were installing [Emacs 24.4](http://www.gnu.org/software/emacs/) 24.3 is the only
version available in the repositories and I found no [Personal Package
Archive (PPA)](https://launchpad.net/ubuntu/%2Bppas) that already supplied it. The remainder of this post
documents the steps required to do this.


## Dependencies {#dependencies}

There are a few things you need to have installed before you can build
Emacs.  You need to update your list of [repository sources](https://help.ubuntu.com/community/Repositories/CommandLine) first.

Edit the file `/etc/apt/sources.list` as root.  On a new Ubuntu 14.04 instance
it looks like this:

```text
deb http://archive.ubuntu.com/ubuntu trusty main restricted universe
deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe
deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu trusty partner
```

You need to enable the source code repositories.  This is very simple
to do.  Just duplicate the first four lines in the file and change
`deb` at the beginning of the line to `deb-src`.  When you have done
this the file will look like this:

```text
deb http://archive.ubuntu.com/ubuntu trusty main restricted universe
deb http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe
deb http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb http://archive.canonical.com/ubuntu trusty partner
deb-src http://archive.ubuntu.com/ubuntu trusty main restricted universe
deb-src http://archive.ubuntu.com/ubuntu trusty-updates main restricted universe
deb-src http://security.ubuntu.com/ubuntu trusty-security main restricted universe multiverse
deb-src http://archive.canonical.com/ubuntu trusty partner
```

Save your changes and then run the following command:

```sh
sudo apt-get update
```

Now you can install the dependencies that you will need:

```sh
sudo apt-get install build-essential
sudo apt-get build-dep emacs24
```


## Building Emacs 24.4 {#building-emacs-24-dot-4}

I like to organize my projects in a directory hierarchy like this:

-   `$HOME/Projects/`
    -   `0-9/`
    -   `a/`
    -   `b/`
    -   ...
    -   `z/`

So, my Emacs build would be located in the `$HOME/Projects/e`
directory.  Please feel free to ignore the above.  It is just a
personal preference.  With that out of the way, here we go...

```sh
mkdir -p $HOME/Projects/e
cd $HOME/Projects/e
wget ftp.gnu.org/gnu/emacs/emacs-24.4.tar.xz
tar -xf emacs-24.4.tar.xz
rm emacs-24.4.tar.xz
cd emacs-24.4
./configure
make
sudo make install
```

That's all there is to it!
