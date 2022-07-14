#!/bin/sh
sh get-versions.sh >versions.txt
sh clean.sh
sh build.sh
sh get-times.sh | tee times.txt
sh format-times.sh <times.txt >times.md
rm times.txt
