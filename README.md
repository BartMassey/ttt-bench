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
  benefits from whole-program compilation. I did turn on
  link-time optimization for compiled code where I could,
  though: that seems fair.

I used standard language tools, and the fastest settings I
could manage. Timing loops were adjusted to give runtimes of
at least a few seconds to amortize overhead.

## Results

Per-iteration timings on my home machine (Intel i7-4770K CPU
@ 3.50GHz) from a run 2020-02-25 are as follows:

        Rust:                  0.0088s
        C[clang]:              0.0092s
        C[gcc]:                0.013s
        Java[100]:             0.023s
        Java[10]:              0.028s
        Go:                    0.034s
        JavaScript[d8]:        0.080s
        JavaScript[smjs]:      0.090s
        Haskell[bobw]:         0.19s
        PHP[7.4]:              0.20s
        Haskell[imperative]:   0.26s
        Haskell[functional]:   0.31s
        Python[pypy]:          0.35s
        PHP[5]:                0.59s
        JavaScript[rhino]:     0.71s
        Erlang[beam]:          1.6s
        Erlang[hipe]:          1.6s
        Python[nuitka3]:       2.1s
        Python[python3]:       3.4s
        Nickle:                4.5s

I have quit listing times for Octave and Matlab. Octave
seems stuck at about 110s, which is a pain to deal with. I
don't have convenient access to Matlab, and none at all on
my hardware.

I was surprised to see the differences in performance
between languages. Slow recursion might be a problem for
this code, but most of the time is expected to be spent in
gamevalue() checking for wins. As such, it's running the
most generic little `for`-loops ever.

### Notes

* Rust: Compiled with `rustc` 1.41.0 via `cargo` with the
  best optimizations I could find (see `Cargo.toml`).

  The run-to-run variance in the Rust measurements is quite
  high.

  Tried using vectors instead of arrays, but the result was
  about 38% slower. See the branch `rust-vector`. Tried
  using the `ndarray` crate; result was slightly unreadable,
  but quite a bit slower. See the branch `rust-ndarray`.

* C[clang]: Compiled with Clang 8.0.1-7 with `-O3`. See the
  Makefile for other optimization flags.

* C[gcc]: Compiled with GCC 9.2.1 with `-O4`.  See the
  Makefile for other optimization flags. I am deeply
  suspicious of the doubled runtime vs `clang` and `rustc`:
  could be real, could be an artifact of the benchmark setup
  being taken advantage of by LLVM.

* Java[100]: Compiled with Oracle `javac` 1.8.0 with `-O`. The
  100-iteration timing loop amortizes away much of the
  startup cost and gives time for the Hotspot JIT to kick
  in.

* Java[10]: Run with a 10-iteration timing loop for
  comparison purposes.

* Go: Compiled with Golang (gc) 1.13.7 via "go build".  Test
  version compiled with gccgo was much slower.

* JavaScript[smjs]: Using the js shell of SpiderMonkey, version
  C60.8.0.

* JavaScript[d8]: Using the d8 shell of the v8 interpreter,
  version 7.3.0.

* JavaScript[rhino]: Using the Java-based rhino interpreter
  shell, version 1.7.7.1, with `-opt 9`.

* Haskell[imperative]: A relatively unoptimized imperative version
  using `Data.Array.IO` and sticking as closely as possible
  to the pseudocode. Compiled with GHC 8.6.5 with
  `-O2`. Ugly, and required some ugly plumbing.

* Haskell[functional]: A reasonably natural pure-functional
  version of the Haskell code using `Data.Map` but following
  the general outline of the pseudocode. Compiled with GHC
  8.6.5 with `-O2`.

  I have not figured out a way to run more than one
  iteration internal to the program without all of Haskell's
  laziness optimizing most of subsequent iterations away;
  the Haskell compiler is too clever for me.

* Haskell[bobw]: A "best of both worlds" version of the Haskell
  code using `Data.Array.IO` but with cleaned-up functional
  style. Compiled with GHC 8.6.5 with `-O2`.

* PHP[5]: Contributed by Matthew Slocum. Run with PHP 5.6.40.

* PHP[7.4]: Contributed by Matthew Slocum. Run with PHP 7.4.3.

* Python[pypy]: Run using the PyPy JIT compiler version 7.3.0 with
  GCC 9.2.1.

* Python[nuitka3]: Compiled with the Nuitka3 compiler version
  0.6.7. See the build script for flags.

* Python[python3]: Run using stock Python3 version 3.7.6.

* Erlang[beam]: Compiled to BEAM bytecode using `erlc`
  22.2.4.

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
  `erlc` 22.2.4. This seems to be identical to the BEAM
  version at this point, which makes me suspicious that I am
  not compiling things right.

* Nickle: Run with version 2.77.


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

Finally, you can run

        sh get-versions.sh

to save a lot of work tracking down the various version
numbers.

## License

This code is made available under the "MIT License". Please
see the file COPYING in this distribution for license
details.
