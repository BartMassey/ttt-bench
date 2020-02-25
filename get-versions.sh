#!/bin/sh
rustc --version | awk '{print $1, $2}'
clang --version | head -1 | sed 's/ (.*//' | awk '{print $1, $3}'
gcc --version | head -1 | sed 's/ (.*)//' | awk '{print $1, $2}'
javac -version 2>&1
go version | sed 's/ go/ /' | awk '{print $1, $3}'
smjs --version | sed 's/.*-C/smjs C/'
d8 </dev/null | head -1 | awk '{print $1, $3}' | sed 's/V8/d8/'
rhino </dev/null | head -1
ghc --version | awk '{print "GHC", $NF}'
php5 --version | head -1 | sed -e 's/PHP/PHP5/' -e 's/-.*//'
php7.4 --version | head -1 | sed -e 's/PHP/PHP7.4/' -e 's/ (.*//'
pypy --version 2>&1 | tail -1 | sed 's/^\[//' | awk '{print $1, $2}'
nuitka3 --version | head -1 | awk '{print "nuitka3", $1}'
python3 --version
erl \
    -eval '{ok, Version} = file:read_file(filename:join([code:root_dir(), "releases", erlang:system_info(otp_release), "OTP_VERSION"])), io:fwrite(Version), halt().' \
    -noshell |
    awk '{print "erlang", $1}'
nickle -e "version" | tr -d '"' | awk '{print "nickle", $1}'
