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
@ 3.8GHz) from a run 2022-06-23 are as follows:

        C[clang]:              0.0058s
        Rust:                  0.0058s
        C[gcc]:                0.013s
        Java[100]:             0.018s
        Java[10]:              0.026s
        Go:                    0.028s
        JavaScript[d8]:        0.068s
        JavaScript[smjs]:      0.073s
        Haskell[bobw]:         0.14s
        PHP[8.1]:              0.15s
        Haskell[imperative]:   0.18s
        Haskell[functional]:   0.29s
        Python[pypy]:          0.29s
        JavaScript[rhino]:     0.72s
        Python[nuitka]:        1.4s
        Erlang[hipe]:          1.5s
        COBOL:                 1.9s
        Python[python3]:       2.2s
        Erlang[beam]:          2.4s
        Nickle:                4.6s

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

  Tried using vectors instead of arrays, but the result was
  slower. See the branch `rust-vector`. Tried using the
  `ndarray` crate; result was slightly unreadable, but quite
  a bit slower. See the branch `rust-ndarray`.

* C[clang]: Compiled with Clang with `-O3`. See the
  `Makefile` for other optimization flags.

* C[gcc]: Compiled with GCC with `-O4`.  See the
  `Makefile` for other optimization flags. I am deeply
  suspicious of the doubled runtime vs `clang` and `rustc`:
  could be real, could be an artifact of the benchmark setup
  being taken advantage of by LLVM.

* Java[100]: Compiled with Oracle `javac` with `-O`. The
  100-iteration timing loop amortizes away much of the
  startup cost and gives time for the Hotspot JIT to kick
  in.

* Java[10]: Run with a 10-iteration timing loop for
  comparison purposes.

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
  (aka OpenCobol). This benchmark probably isn't terribly
  fair to the COBOL compiler. I am not at all knowledgeable
  about COBOL: there may well be small code changes or
  changes in compiler invocation that will speed the code up
  dramatically.

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

        sh get-versions.sh | tee versions.txt

to save a lot of work tracking down the various version
numbers.

## License

This code is made available under the "MIT License". Please
see the file COPYING in this distribution for license
details.
