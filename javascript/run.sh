#!/bin/sh
INTERP="$1"
COUNT="$2"
shift 2
if [ $# -ne 0 ]
then
    echo "usage" >&2
    exit 1
fi

TMP=/tmp/js.$$
trap "rm -f $TMP" 0 1 2 3 15
cat gamevalue.js negamax.js ttt.js >$TMP

case $INTERP in
d8)
    d8 $TMP -- $COUNT
    ;;
smjs)
    smjs $TMP -- $COUNT
    ;;
rhino)
    rhino $TMP $COUNT
    ;;
*)
    echo "unknown interpreter" >&2
    exit 1
esac
