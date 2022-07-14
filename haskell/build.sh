#!/bin/sh
cabal update
for x in bobw functional imperative
do
    (
        cd $x &&
        cabal clean &&
        cabal configure &&
        cabal install --installdir=. --overwrite-policy=always
    )
done
