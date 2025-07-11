+++
title = "Org-Octopress Notes"
author = ["Gordon Tillman"]
date = 2015-01-04
tags = ["emacs", "octopress", "github"]
draft = false
+++

I've been trying to sort-out the details of what is required to be
able to maintain a GitHub pages site via Octopress / org-octopress
from multiple computers. The slight complicating factor is that the
location of the git repository for the site is different on the two
computers that I am using.

<!--more-->

The main laptop is my MacBook Pro.  The new, secondary, laptop is an
ASUS C200 with 4GB RAM and a 32GB SSD.  Here are the repository
locations on the two machines:

| Machine     | Org-Octopress Git Repository Location               |
|-------------|-----------------------------------------------------|
| MacBook Pro | /Users/gordy/Documents/Personal/gordyt.github.io    |
| ASUS C200   | /media/removable/gordy/Documents/g/gordyt.github.io |

<div class="HTML">

&lt;br&gt;

</div>

On the ASUS I have a symlink in my `$HOME` directory the the
`Documents` folder on the external drive.  The external drive is a 16
CB SD card.


## Setupfile {#setupfile}

Org-octopress has a setting called `org-octopress-setup-file` that
points to your blog-specific information.  It references this file
when it exports your org-mode source file to the HTML file it
that Jekyll uses to generate your GitHub pages site.

When you create a new post, Org-octopress fills in a skeleton org-mode
file that you use to write in to compose your blog post.  When it does
this it fills in the path for a setting at the top:

```text
#+SETUPFILE: <path-to-setupfile>
```

For this to work nicely, it is helpful to store your setup file a
place that you can reference with a nice relative path on all the
machines involved.  In my case I used this:

```text
~/.emacs.d/octopress-setupfile.txt
```

If I were maintaining multiple sites I would give the setup file for
each site a unique name.


## Keep your Repositories Straight! {#keep-your-repositories-straight}

The scripts that set-up your site structure handles everything for
you.  However, if you clone your existing site onto a new machine, you
must make sure that the following conditions are satisfied.  In what
follows _site-root_ is the path to the main git repository on your
local machine where the site is being maintained.

-   &lt;site-root&gt; is a git repository with the following remotes:
    ```text
    octopress   git://github.com/imathis/octopress.git (fetch)
    octopress   git://github.com/imathis/octopress.git (push)
    origin  <your-github-repository-path> (fetch)
    origin  <your-github-repository-path> (push)
    ```
-   It has the _source_ branch checked-out
-   `<site-root>/_deploy` is a sub-directory that is maintained by
    Jekyll.  It is _also_ a git repository with the following remotes:
    ```text
    origin  <your-github-repository-path> (fetch)
    origin  <your-github-repository-path> (push)
    ```
-   It has the _master_ branch checked-out.
-   This `_deploy` directory is in the main repos `.gitignore` file.

So, when you want to set-up a secondary machine where you can maintain
your site, you must manually checkout a copy of the repo into the
`_deploy` sub-directory and make sure the `master` branch is
checked-out.

One other note about this:  If you get an error from Jekyll when it
tries to deploy your site when it tries to push _master -&gt; master_,
you need to go into the `_deploy` sub-directory and do something like
this:

```sh
git fetch origin
git rebase origin master
git push origin master
```
