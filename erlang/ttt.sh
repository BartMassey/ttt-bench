#!/bin/sh
# http://erlangcentral.org/wiki/index.php?
#  title=Running_Erlang_Code_From_The_Command_Line
REPS=1
if [ $# -gt 0 ]
then
    REPS="$1"
fi
erl -pa . -run ttt bench "$REPS" -run init stop -noshell
