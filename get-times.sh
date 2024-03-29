#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

# Run all the implementations, reporting timing.

# I was using a non-standard version of the "time" command I
# rewrote to get extra precision.  I plan to upstream
# it. Now that I've ironed out timing loop lengths, it
# should actually be adequate to use standard time in the
# meantime.

#TIME="etime -f %3e"
TIME="time -f %e"

# Note: "2>&1 >/dev/null" sends the time output that was on
# stderr to stdout and throws away the result "0" that the
# program prints on stdout.

( cd php
  echo -n "PHP[8.1]: 10 "
  $TIME php8.1 ttt.php 10 2>&1 >/dev/null )

( cd rust
  echo -n "Rust: 500 "
  $TIME target/release/ttt 500 2>&1 >/dev/null )

( cd c
  echo -n "C[clang]: 500 "
  $TIME ./ttt-clang 500 2>&1 >/dev/null
  echo -n "C[gcc]: 500 "
  $TIME ./ttt-gcc 500 2>&1 >/dev/null )

( cd javascript
  echo -n "JavaScript[smjs]: 50 "
  $TIME sh run.sh smjs 50 2>&1 >/dev/null
  echo -n "JavaScript[d8]: 50 "
  $TIME sh run.sh d8 50 2>&1 >/dev/null
  echo -n "JavaScript[rhino]: 5 "
  $TIME sh run.sh rhino 5 2>&1 >/dev/null )

( cd java
  echo -n "Java[OpenJDK100]: 100 "
  $TIME sh run.sh openjdk 100 2>&1 >/dev/null
  echo -n "Java[OracleJDK100]: 100 "
  $TIME sh run.sh oracle 100 2>&1 >/dev/null
  echo -n "Java[Oracle1]: 1 "
  $TIME sh run.sh oracle 1 2>&1 >/dev/null )

( cd go
  echo -n "Go: 100 "
  $TIME ./ttt 100 2>&1 >/dev/null )

( cd haskell/imperative
  echo -n "Haskell[imperative]: 10 "
  $TIME ./ttt 10 2>&1 >/dev/null )

# We are stuck with one iteration until this
# can be black-boxed properly. See Issue #6.
( cd haskell/functional
  echo -n "Haskell[functional]: 1 "
  $TIME ./ttt 1 2>&1 >/dev/null )

( cd haskell/bobw
  echo -n "Haskell[bobw]: 10 "
  $TIME ./ttt 10 2>&1 >/dev/null )

( cd erlang/beam
  echo -n "Erlang[beam]: 5 "
  $TIME sh ../ttt.sh 5 2>&1 >/dev/null )

( cd erlang/hipe
  echo -n "Erlang[hipe]: 5 "
  $TIME sh ../ttt.sh 5 2>&1 >/dev/null )

( cd python
  echo -n "Python[pypy]: 5 "
  $TIME pypy ttt.py 5 2>&1 >/dev/null
  echo -n "Python[nuitka]: 2 "
  $TIME ./ttt-nuitka 2 2>&1 >/dev/null
  echo -n "Python[python3]: 1 "
  $TIME python3 ttt.py 1 2>&1 >/dev/null )

( cd cobol
  echo -n "COBOL: 2 "
  echo 2 | $TIME ./ttt 2>&1 >/dev/null )

( cd nickle
  echo -n "Nickle: 1 "
  $TIME /usr/bin/nickle ttt.5c 2>&1 >/dev/null )

# We ran Matlab elsewhere long ago
# echo "Matlab*: 1 15"

# Octave takes too damn long
#( cd octave
#  echo -n "Octave: 1 "
#  etime -f '%0e' octave ttt.m 2>&1 >/dev/null )
# echo "Octave*: 1 110"
