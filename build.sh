#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

# Build all the implementations.

( echo "rust:" >&2
  cd rust
  cargo update
  cargo clean
  rm -f Cargo.lock
  cargo build --release )

( echo "c:" >&2
  cd c
  sh build.sh )

( echo "java:" >&2
  cd java
  rm -f *.class
  javac -O *.java )

( echo "go:" >&2
  cd go
  GOPATH="`pwd`"
  export GOPATH
  go clean
  go build src/ttt.go )

( echo "haskell/imperative:" >&2
  cd haskell/imperative
  cabal v2-update
  cabal v2-clean
  cabal v2-configure
  cabal v2-build )


( echo "haskell/functional:" >&2
  cd haskell/functional
  cabal v2-update
  cabal v2-clean
  cabal v2-configure
  cabal v2-build )

( echo "haskell/bobw:" >&2
  cd haskell/bobw
  cabal v2-update
  cabal v2-clean
  cabal v2-configure
  cabal v2-build )

( echo "python:" >&2
  cd python
  sh build.sh )

( echo "erlang:" >&2
  cd erlang
  sh build.sh )

( echo "cobol:" >&2
  cd cobol
  make clean
  make )
