#!/bin/sh
# http://erlangcentral.org/wiki/index.php?
#  title=Running_Erlang_Code_From_The_Command_Line
erl -pa . -run ttt -run init stop -noshell
