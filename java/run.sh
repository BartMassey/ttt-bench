#!/bin/sh
case $1 in
    openjdk)
        cd openjdk
        /usr/lib/jvm/java-19-openjdk-*/bin/java TTT "$2" >/dev/null
        ;;
    oracle)
        cd oracle
        /usr/lib/jvm/java-17-oracle/bin/java TTT "$2" >/dev/null
        ;;
    *)
        echo "unknown java $1; exiting" >&2
        exit 1
        ;;
esac
