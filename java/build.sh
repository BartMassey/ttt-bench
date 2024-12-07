#!/bin/sh
sh clean.sh
mkdir openjdk oracle
/usr/lib/jvm/java-25-openjdk-*/bin/javac -O *.java
mv *.class openjdk/
/usr/lib/jvm/default-java/bin/javac -O *.java
mv *.class oracle/
