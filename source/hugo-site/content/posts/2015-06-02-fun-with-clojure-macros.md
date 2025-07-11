+++
title = "Fun with Clojure Macros"
author = ["Gordon Tillman"]
date = 2015-06-02
tags = ["clojure", "lisp"]
draft = false
+++

It all started innocently enough.  I had a `deftype` that was
implementing several protocols.  I had written all of the protocol
functions inside the body of the `deftype`.  And even though each
function, by itself, wasn't overly large, the entire blob of code was
getting out of hand.

Here is a tiny little example with some made-up protocols and a type
that embedded the protocol implementation inside the `deftype`.  In
the actual code there were many more methods that needed to be
implemented.

```clojure
(defprotocol Proto1
  (p11 [this])
  (p12 [this foo bar]))
(defprotocol Proto2
  (p21 [this])
  (p22 [this baz bin]))
(deftype MyType [item1 item2 item3 item4]
  Proto1
  (p11 [this] ...)
  (p12 [this foo bar] ...)
  Proto2
  (p21 [this] ...)
  (p22 [this baz bin] ...))

```

<!--more-->

A little investigation showed that it was pretty trivial to move the
methods out of the body of the `deftype` and then just do something
like the following.  Keep in mind that the functions, protocols, etc.,
are just BS ones I made up for this post.

```clojure
(defprotocol Proto1
  (p11 [this])
  (p12 [this foo bar]))
(defprotocol Proto2
  (p21 [this])
  (p22 [this baz bin]))
(deftype MyType [item1 item2 item3 item4])

(defn- mt-p11 [this] ...)
(defn- mt-p12 [this foo bar] ...)

(defn- mt-p21 [this] ...)
(defn- mt-p22 [this baz bin] ...)

(def p1map {:p11 mt-p11 :p12 mt-p12})
(def p2map {:p21 mt-p21 :p22 mt-p22})

(extend MyType
  Proto1
  p1map
  Proto2
  p2map)
```

That was all well and good, except for one thing.  Before, when the
protocol methods were all defined inside the body of the type, they
had full access to all of the type's data; e.g., `item1`, `item2`,
etc.

This was no longer the case.  Now every time that one of the type's
instance data was used it had to be looked-up laboriously like this.

```clojure
(defn- mt-p11 [this]
  (let [item1 (.item1 this)
        item2 (.item2 this)
        ...]
    ...))
```

That was tedious.  And even if I switched over to using a `defrecord`
instead of a `deftype`, I had to do this...

```clojure
(defn- mt-p11 [this]
  (let [item1 (:item1 this)
        item2 (:item2 this)
        ...]
    ...))
```

...or this...

```clojure
(defn- mt-p11 [this]
  (let [{:keys [:item1 :item2 :item3 :item4]} this]
    ;; original function body goes here
    ...))

```

...or (the correct way)...

```clojure
(defn- mt-p11 [{:keys [:item1 :item2 ...] :as this}]
  ...)
```

Now, keep in mind that, what I just showed you where the values were
destructured nicely (and still giving access to the "this" argument,
if needed) is absolutely the right way to do it.

But we played around with the idea of writing a macro that would
_automatically_ make all of the record's data available to the
existing functions.  That turned out to be an interesting exercise and
was a really small amount of code.

But it made us uncomfortable using the technique because, even though
the resulting code was completely correct, it made it seemed a bit too
much like magic.  We agreed that it was a mis-use of macros.

This is the macro and its helper function.

```clojure
(defn- map->letx [m & body]
  (eval `(let [{:keys ~(vec (keys m))} ~m]
     ~@body)))

(defmacro map->let [m & body]
  `(map->letx ~m  (quote ~@body)))
```

And you would use it like this.

```clojure
(defn- mt-p11 [this]
  (map->let this
            ;; old function body goes here.  All of the instance data of the
            ;; record is available without going through "this."
            ;; e.g., item1, item2, item3, item4
            ...))
```
