#!/bin/sh
for x in bobw functional imperative
do
    (
        cd $x &&
        cabal clean &&
        rm -rf ttt *~*
    )
done
