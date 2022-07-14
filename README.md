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

Per-iteration timings on my home machine (AMD Ryzen 9 3900X CPU
@ 3.8GHz) from a run 2022-07-14 are as follows:

        C[clang]:              0.0059s
        Rust:                  0.0060s
        C[gcc]:                0.014s
        Java[OpenJDK100]:      0.018s
        Java[OracleJDK100]:    0.019s
        Go:                    0.029s
        JavaScript[d8]:        0.061s
        Java[Oracle1]:         0.080s
        JavaScript[smjs]:      0.090s
        Haskell[bobw]:         0.14s
        PHP[8.1]:              0.15s
        Haskell[imperative]:   0.18s
        Haskell[functional]:   0.27s
        Python[pypy]:          0.28s
        JavaScript[rhino]:     0.75s
        COBOL:                 1.4s
        Python[nuitka]:        1.4s
        Erlang[hipe]:          1.6s
        Python[python3]:       2.2s
        Erlang[beam]:          2.5s
        Nickle:                4.7s

I have quit listing times for Octave and Matlab. Octave
seems stuck at about 110s, which is a pain to deal with. I
don't have convenient access to Matlab, and none at all on
my hardware.

I am always surprised to see the differences in performance
between languages. Slow recursion might be a problem for
this code, but most of the time is expected to be spent in
gamevalue() checking for wins. As such, it's running the
most generic little `for`-loops ever.

### Notes

* For software versions, see the file
  [`versions.txt`](versions.txt) in this distribution.

* Rust: Compiled with `rustc` via `cargo` with the
  best optimizations I could find (see `Cargo.toml`).

* C[clang]: Compiled with Clang with `-O3`. See the
  `Makefile` for other optimization flags.

* C[gcc]: Compiled with GCC with `-O3`.  See the `Makefile`
  for other optimization flags. The doubled runtime of GCC
  *vs* LLVM's `clang` and `rustc` seems to be real after
  some investigation. More research is needed.

* Java[Oracle100]: Compiled with Oracle `javac` with `-O`.

* Java[Oracle1]: Oracle `java` for one iteration for
  comparison purposes.  A 100-iteration timing loop
  amortizes away much of the startup cost and gives time for
  the Hotspot JIT to kick in. The difference is pretty
  dramatic.

* Java[OpenJDK100]: Compiled with OpenJDK `javac` with `-O`.

* Go: Compiled with Golang (gc) via "go build".  Test
  version previously compiled with gccgo was much slower.
  Built with `GO111MODULE=off`; be careful.

* JavaScript[smjs]: Using the js shell of SpiderMonkey.

* JavaScript[d8]: Using the d8 shell of the v8 interpreter.

* JavaScript[rhino]: Using the Java-based rhino interpreter
  shell, with `-opt 9`.

* Haskell[imperative]: A relatively unoptimized imperative version
  using `Data.Array.IO` and sticking as closely as possible
  to the pseudocode. Compiled with GHC with
  `-O2`. Ugly, and required some ugly plumbing.

* Haskell[functional]: A reasonably natural pure-functional
  version of the Haskell code using `Data.Map` but following
  the general outline of the pseudocode. Compiled with GHC
  with `-O2`. Based on one iteration: see
  [Issue #6](https://github.com/BartMassey/ttt-bench/issues/6).

* Haskell[bobw]: A "best of both worlds" version of the Haskell
  code using `Data.Array.IO` but with cleaned-up functional
  style. Compiled with GHC with `-O2`.

* PHP: Contributed by Matthew Slocum.

* Python[pypy]: Run using the PyPy JIT compiler with GCC.

* Python[nuitka3]: Compiled with the Nuitka3 compiler.
  See the build script for flags.

* Python[python3]: Run using stock Python3.

* Erlang[beam]: Compiled to BEAM bytecode using `erlc`.

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
  `erlc`.

* COBOL: Compiled to C and thence to native using GNU Cobol
  (aka OpenCobol). See the README in
  [the original source repo](http://github.com/BartMassey/TTT-SOLVER-COBOL)
  for a thorough discussion.

## Replication

To run this yourself, you'll first need to install the
languages being measured. They are mostly available from stock
Debian: if you are on a Debian-derived Linux distro, you can
run

        sh install-languages.sh

as root to get these. Make sure `unstable` is in your `apt`
sources: we want to use the latest tools.

Sadly, `d8` is currently the fastest JavaScript interpreter
I've found. It is not available in Debian, and building it
is something of a project. Find current instructions on the
interwebs, or just comment it out everywhere.

For Rust it would probably be a good idea to use the latest
version rather than the Debian-packaged one, since Debian
doesn't keep up-to-date really well. Go to
https://rustup.rs and follow those instructions, or
uncomment the Rust line in `install-languages.sh`.

After that, things are straightforward: just compile
and run the benchmarks and collect the results with

        sh benchmark.sh

You can then `git diff` the `versions.txt` and `times.md`
files produced by this to see what's up.

When you are done, you may want to run

        sh clean.sh

to clean up the big binaries here.

## License

This code is made available under the "MIT License". Please
see the file COPYING in this distribution for license
details.
