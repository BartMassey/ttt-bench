#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

# Clean all the built implementations.

( echo "rust:" >&2
  cd rust
  cargo clean
  rm -f Cargo.lock )

( echo "c:" >&2
  cd c
  make clean )

( echo "java:" >&2
  cd java
  rm -f *.class )

( echo "go:" >&2
  cd go
  GOPATH="`pwd`"
  export GOPATH
  go clean
  rm -f ttt )

( echo "haskell/imperative:" >&2
  cd haskell/imperative
  cabal v2-clean
  rm -rf dist
  rm -rf cabal.project.local
  rm -f *~ )


( echo "haskell/functional:" >&2
  cd haskell/functional
  cabal v2-clean
  rm -rf dist
  rm -rf cabal.project.local
  rm -f *~ )

( echo "haskell/bobw:" >&2
  cd haskell/bobw
  cabal v2-clean
  rm -rf dist
  rm -rf cabal.project.local
  rm -f *~ )

( echo "python:" >&2
  cd python
  sh clean.sh )

( echo "erlang:" >&2
  cd erlang
  sh clean.sh )

( echo "cobol:" >&2
  cd cobol
  make clean )
