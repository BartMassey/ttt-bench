#!/bin/sh
apt update
apt -t unstable install \
    build-essential \
    clang gcc \
    openjdk-19-jdk oracle-java17-installer \
    golang-go \
    ghc cabal-install \
    erlang-base-hipe \
    gnucobol4 \
    python3 \
    nickle \
    libmozjs-91-dev rhino
    # rustc cargo
