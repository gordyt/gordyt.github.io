+++
title = "Chromebook Performance Test - C720 vs C200"
author = ["Gordon Tillman"]
date = 2015-01-08
tags = ["chromebook", "emacs"]
draft = false
+++

My buddy at work just got a new Acer C720-3404 Chromebook.  I have the
ASUS C200MA-EDU-4GB Chromebook.  We decided to do a real-world
performance comparison with a sample task that we have to perform all
of the time.

<!--more-->

This task was compiling a program.  We choose to compile Emacs 24.4.
Here are the results.

| **Task**    | **Acer C720**          | **ASUS C200**           |
|-------------|------------------------|-------------------------|
| ./configure | 37.1 seconds           | 1 minute, 7.4 seconds   |
| make        | 3 minutes, 2.2 seconds | 5 minutes, 44.3 seconds |

As you can see, the Acer C720 with its _1.7 GHz Core i3_ processor
was much faster than the ASUS with its _2.16 GHz Celeron_ processor.
