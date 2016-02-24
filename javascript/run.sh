#!/bin/sh
INTERP="$1"
shift
case $INTERP in
d8)
    d8 "$@" gamevalue.js negamax.js ttt.js
    ;;
js|rhino)
    TMP=/tmp/js.$$
    trap "rm -f $TMP" 0 1 2 3 15
    cat gamevalue.js negamax.js ttt.js >$TMP
    $INTERP "$@" $TMP
    ;;
esac
