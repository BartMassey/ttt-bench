#!/bin/sh
sh clean.sh
mkdir openjdk oracle
/usr/lib/jvm/java-19-openjdk-*/bin/javac -O *.java
mv *.class openjdk/
/usr/lib/jvm/java-17-oracle/bin/javac -O *.java
mv *.class oracle/
