#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

# Build all the implementations.

( echo "rust:" >&2
  cd rust
  cargo clean
  cargo build )

( echo "c:" >&2
  cd c
  make clean
  make )

( echo "java:" >&2
  cd java
  rm *.class
  javac -O *.java )
