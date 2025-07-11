# What I had to do for org-octopress -> hugo

After cloning the cluster and checking out the `source` branch:

- git submodule add https://github.com/theNewDynamic/gohugo-theme-ananke.git source/hugo-site/themes/
- git submodule update --init --recursive
- git config submodule.recurse true
  - This was so didn't have to manually do the update every time this branch got checked out.
  
TODO more notes

