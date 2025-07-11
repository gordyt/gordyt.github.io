+++
title = "SBCL and Slime on Ubuntu 14.04"
author = ["Gordon Tillman"]
date = 2015-01-03
tags = ["ubuntu", "sbcl", "slime"]
draft = false
+++

This post describes how to install and configure Steel Bank Common
Lisp (SBCL) with SLIME (Superior Lisp Interaction Mode) that is
installed via [Quicklisp](http://www.quicklisp.org/) on Ubuntu 14.04 LTS (Trusty Tahr).

<!--more-->


## Install SBCL {#install-sbcl}

```sh
sudo apt-get install sbcl sbcl-doc
```


## Install Quicklisp {#install-quicklisp}

```sh
curl -O http://beta.quicklisp.org/quicklisp.lisp
sbcl --load quicklisp.lisp
(quicklisp-quickstart:install)
(ql:add-to-init-file)
```


## Install slime via quicklisp {#install-slime-via-quicklisp}

While still in the SBCL session

```sh
(ql:quickload "quicklisp-slime-helper")
```
