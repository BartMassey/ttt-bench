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
  sh clean.sh )

( echo "java:" >&2
  cd java
  sh clean.sh )

( echo "go:" >&2
  cd go
  GOPATH="`pwd`"
  export GOPATH
  go clean
  rm -f ttt )

( echo "haskell:" >&2
  cd haskell
  sh clean.sh )

( echo "python:" >&2
  cd python
  sh clean.sh )

( echo "erlang:" >&2
  cd erlang
  sh clean.sh )

( echo "cobol:" >&2
  cd cobol
  make clean )
