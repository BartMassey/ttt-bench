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

* C[1]: Compiled with `clang -O3 -march=native` using Clang
  3.8. This was measured with a timing loop, so the result
  is relatively accurate.

* C[2]: Compiled with `gcc -O4 -march=native` using GCC
  5.3.1. This was measured with a timing loop, so the result
  is relatively accurate.

* Rust: Compiled with `rustc` 1.5.0 via `cargo` with
  debugging turned off, `opt-level = 3` and `lto =
  true`. This was measured with a timing loop, so the result
  is relatively accurate.

  Tried using vectors instead of bounded lists, but the
  result was about 38% slower. See the branch `rust-vector`.

* Java: Compiled with Oracle `javac` 1.8.0 with `-O`. This
  was measured with a timing loop, so the result is
  relatively accurate and amortizes away startup costs.

* JavaScript[1]: Using the d8 shell of the v8 interpreter,
  version 3.14.5. This was measured with a timing loop, so
  the result is relatively accurate.

* JavaScript[2]: Using the js shell of SpiderMonkey, version
  C24.8.1. This was measured with a timing loop, so the
  result is relatively accurate.

* JavaScript[3]: Using the Java-based rhino interpreter
  shell, version 1.7R4, with `-opt 9`. This was measured
  with a timing loop, so the result is relatively accurate.

* Haskell[1]: A relatively unoptimized imperative version
  using `Data.Array.IO` and sticking as closely as possible
  to the pseudocode. Compiled with `-O2`. Ugly, and required
  some ugly plumbing.

* Haskell[2]: A reasonably natural pure-functional version
  of the Haskell code using `Data.Map` but following the
  general outline of the pseudocode. Compiled with `-O2`.

* Haskell[3]: A "best of both worlds" version
  of the Haskell code using `Data.Array.IO` but with
  cleaned-up functional style. Compiled with `-O2`.
  (Lots of run-time variance, which indicates opportunities
  for speedups.)

* Python[1]: Using the PyPy JIT compiler.

* Python[2]: Using stock Python 3.

* Erlang: Because the start-up and cool-down time for this
  language is so long, I ran a timing loop of 10 tries;
  looks like about 1s total. Erlang takes a noticeable
  amount of time to stop after printing the answer.

  Because Erlang has no for loops and weird array stuff, the
  code isn't entirely comparable to the other languages
  benchmarked here.

* Matlab*: Run on a different (much slower) machine,
  because I had access to Matlab there.

Timings on my home machine (Intel i7-4770K CPU @ 3.50GHz)
are as follows:

        C[1]:            0.010s
        C[2]:            0.012s
        Rust:            0.016s
        Java:            0.021s
        JavaScript[1]:   0.10s
        JavaScript[2]:   0.10s
        JavaScript[3]:   0.39s
        Haskell[3]:      0.4s
        Haskell[1]:      0.45s
        Python[1]:       0.59s
        Haskell[2]:      1.3s
        Erlang:          2.3s
        Python[2]:       4.0s
        Nickle:          5.5s
        Matlab*:         15s
        Octave:          135s

Yes, Octave is more than 10000x slower than C on this
benchmark!

I was surprised to see the differences in performance
between languages. Slow recursion might be a problem for
this code, but most of the time is expected to be spent in
gamevalue() checking for wins. As such, it's running the
most generic little `for`-loops ever.

I split the program across several files, for complicated
reasons. Thus this code is also a demo of separate source
files for the various languages. It also demos the build
systems of those languages that have a standard one.

This code is made available under the "MIT License". Please
see the file COPYING in this distribution for license
details.

Enjoy!
