# Tic-Tac-Toe Benchmarks
Copyright © 2012 Bart Massey

This is as direct as possible a translation of the same
pseudocode into a variety of different imperative languages.
The code is a Tic-Tac-Toe solver: i.e., a search that proves
that Tic-Tac-Toe is a draw. The search is complete and
completely unpruned, so it searches 549946 positions before
proving the draw, calling the board evaluator from scratch
at each position.

I split the program across several files, in order to:

* Demo separate source files for the various languages.
* Demo the build systems of those languages that have a
  "special" one.
* Include a lot of inter-module procedure calls. This is
  in my opinion more realistic than a toy benchmark that
  benefits from whole-program compilation.

I used standard language tools, and the fastest settings I
could manage. Timing loops were adjusted to give runtimes of
at least a few seconds to amortize overhead.

## Results

Per-iteration timings on my home machine (Intel i7-4770K CPU
@ 3.50GHz) from a run 2017-11-28 are as follows:

        C[clang]:              0.0093s
        Rust:                  0.011s
        C[gcc]:                0.014s
        Java[100]:             0.022s
        Java[10]:              0.027s
        Go:                    0.057s
        JavaScript[d8]:        0.094s
        JavaScript[smjs]:      0.095s
        Haskell[bobw]:         0.24s
        Haskell[imperative]:   0.35s
        Python[pypy]:          0.38s
        PHP:                   0.58s
        JavaScript[rhino]:     0.68s
        Haskell[functional]:   0.78s
        Erlang[beam]:          1.1s
        Erlang[hipe]:          1.5s
        Python[python3]:       4.3s
        Nickle:                4.6s
        Matlab*:               15s
        Octave:                135s

Yes, Octave is more than 10000x slower than C on this
benchmark!

I was surprised to see the differences in performance
between languages. Slow recursion might be a problem for
this code, but most of the time is expected to be spent in
gamevalue() checking for wins. As such, it's running the
most generic little `for`-loops ever.

### Notes

* C[clang]: Compiled with `clang -O3 -march=native` using Clang
  4.0.1.

* C[gcc]: Compiled with `gcc -O4 -march=native` using GCC
  7.2.0.

* Rust: Compiled with `rustc` 1.21.0 via `cargo` with the
  best optimizations I could find (see the source). Tried
  using vectors instead of arrays, but the result was about
  38% slower. See the branch `rust-vector`.

* Java[100]: Compiled with Oracle `javac` 1.8.0 with `-O`. The
  100-iteration timing loop amortizes away much of the
  startup cost and gives time for the Hotspot JIT to kick
  in.

* Java[10]: Run with a 10-iteration timing loop for
  comparison purposes.

* Go: Compiled with Golang 1.9 via "go build".

* JavaScript[smjs]: Using the js shell of SpiderMonkey, version
  C24.8.1.

* JavaScript[d8]: Using the d8 shell of the v8 interpreter,
  version 3.14.5.

* JavaScript[rhino]: Using the Java-based rhino interpreter
  shell, version 1.7.7.1, with `-opt 9`.

* Haskell[imperative]: A relatively unoptimized imperative version
  using `Data.Array.IO` and sticking as closely as possible
  to the pseudocode. Compiled with GHC 8.0.2 with
  `-O2`. Ugly, and required some ugly plumbing.

* Haskell[functional]: A reasonably natural pure-functional version
  of the Haskell code using `Data.Map` but following the
  general outline of the pseudocode. Compiled with GHC
  8.0.2 with `-O2`.

* Haskell[bobw]: A "best of both worlds" version of the Haskell
  code using `Data.Array.IO` but with cleaned-up functional
  style. Compiled with GHC 8.0.2 with `-O2`.

* PHP: Contributed by Matthew Slocum. Run with PHP 5.6.30.

* Python[pypy]: Using the PyPy JIT compiler version 5.9.0 with
  GCC 7.2.0.

* Python[python3]: Using stock Python3 version 3.6.3.

* Erlang[beam]: Compiled to BEAM bytecode using `erlc`
  20.1.7.

  Erlang has about 1s of startup overhead, including a
  noticeable amount of time to stop after printing the
  answer; the timing loop is long enough to mostly amortize
  this away.

  Of necessity, the for loops used in the other benchmarks
  have been replaced with recursion here. I have used an
  array-of-arrays as the board type for equivalence; another
  branch of the code has a flattened board and goes about
  20% faster.

* Erlang[hipe]: Compiled to native code via HiPE using
  `erlc` 20.1.7.  This runs some slower than BEAM bytecode,
  although the flattened-board version is almost as fast as
  the flattened-board BEAM code.

* Nickle: Run with version 2.77.

* Matlab*: Run a long time ago on a different (much slower)
  machine, because I had access to Matlab there.

* Octave: Run a long time ago with some ancient version.

## Replication

To run this yourself, you'll first need to install the
languages being measured. They are all available from stock
Debian. After that, you have a 3-step process:

* First compile what needs compiling with

        sh build.sh

* When you've got everything compiled, actually
  run the benchmarks with

        sh get-times.sh | tee times.txt

  The `tee` isn't really necessary, but I like to
  see that things are running.

* To get per-iteration times in Markdown suitable for
  pasting into the README, go with

        sh format-times.sh <times.txt >times.md

I could easily have built a shell script for this, but I've
found there's a lot of manual iteration anyway, so for now I
suggest you just go with it.

## License

This code is made available under the "MIT License". Please
see the file COPYING in this distribution for license
details.
