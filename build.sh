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
  sh build.sh )

( echo "go:" >&2
  unset GOPATH
  export GO111MODULE=on
  cd go/src
  go clean
  go build )

( echo "haskell:" >&2
  cd haskell
  sh build.sh )

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
