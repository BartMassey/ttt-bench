# Tic-Tac-Toe Benchmarks
Copyright © 2012 Bart Massey

This is as direct as possible a translation of the same
pseudocode into a variety of different imperative languages.
The code is a Tic-Tac-Toe solver: i.e., a search that proves
that Tic-Tac-Toe is a draw. The search is complete and
completely unoptimized, so it searches about 550K positions
before proving the draw.

I used standard language tools, and the fastest simple
settings I could manage.

Some notes on some of the implementations:

* Rust: Compiled with all the optimizations I could spot
  turned on including optimization level 3 and link-time
  stuff.

* C: Compiled with `-O2 -march=native`.

* Java: Compiled with -O. Includes Java's large startup
  overhead. Average over many runs with much variance.

* JavaScript[1]: Using the d8 shell of the v8 interpreter.

* JavaScript[2]: Using the js shell of SpiderMonkey.

* JavaScript[3]: Using the Java-based rhino interpreter shell.

* Haskell[1]: A relatively unoptimized imperative version
  using `Data.Array.IO` and sticking as closely as possible
  to the pseudocode. Compiled with `-O2`. Ugly, and required
  some ugly plumbing.

* Haskell[2]: A reasonably natural pure-functional version
  of the Haskell code using `Data.Map` but following the
  general outline of the pseudocode. Compiled with `-O2`.

* Python[1]: Using the PyPy JIT compiler.

* Python[2]: Using stock Python 3.

* Matlab*: Run on a different (much slower) machine,
  because I had access to Matlab there.

Timings on my home machine (Intel i7-4770K CPU @ 3.50GHz)
are as follows:

        Rust:            0.017s
        C:               0.022s
        Java:            0.080s
        JavaScript[1]:   0.10s
        JavaScript[2]:   0.11s
        Haskell[1]:      0.44s
        Python[1]:       0.59s
        JavaScript[3]:   1.1s
        Haskell[2]:      1.3s
        Python[2]:       4.0s
        Nickle:          5.5s
        Matlab*:         15s
        Octave:          135s

Yes, Octave is 6000x slower than C on this benchmark!

I was surprised to see the differences in performance
between languages. Slow recursion might be a problem for
this code, but most of the time is expected to be spent in
gamevalue() checking for wins. As such, it's running the
most generic little `for`-loops ever.

The variance in these measurements can be substantial. I
should run more runs, including warmup runs, and indicate
variance.

I split the program across several files, for complicated
reasons. Thus this code is also a demo of separate source
files for the various languages. It also demos the build
systems of those languages that have a standard one.

This code is made available under the "MIT License". Please
see the file COPYING in this distribution for license
details.

Enjoy!
