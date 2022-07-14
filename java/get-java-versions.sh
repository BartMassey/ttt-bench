#!/bin/sh
echo -n oracle-; /usr/lib/jvm/java-17-oracle/bin/javac -version 2>&1
echo -n openjdk-; /usr/lib/jvm/java-19-openjdk-*/bin/javac -version 2>&1
