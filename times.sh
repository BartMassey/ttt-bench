#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

# Run all the implementations, reporting timing.

# Some implementations currently use a non-standard
# version of the "time" command to get extra precision.
# It is currently being upstreamed.

( ( cd rust
    echo -n "Rust: "
    etime -f '%3e' target/debug/ttt 2>&1 >/dev/null )

  ( cd c
    echo -n "C: "
    etime -f '%3e' ./ttt 2>&1 >/dev/null )

  ( cd java
    echo -n "Java: "
    etime -f '%3e' java TTT 2>&1 >/dev/null )

  ( cd javascript
    echo -n "JavaScript[1]: "
    time -f '%e' sh run.sh d8 2>&1 >/dev/null
    echo -n "JavaScript[2]: "
    time -f '%e' sh run.sh js 2>&1 >/dev/null
    echo -n "JavaScript[3]: "
    time -f '%e' sh run.sh rhino 2>&1 >/dev/null )

  ( cd python
    echo -n "Python[1]: "
    etime -f '%2e' pypy ttt.py 2>&1 >/dev/null
    echo -n "Python[2]: "
    etime -f '%1e' python3 ttt.py 2>&1 >/dev/null )

  ( cd nickle
    echo -n "Nickle: "
    etime -f '%1e' /usr/bin/nickle ttt.5c 2>&1 >/dev/null )

  ( cd octave
    echo -n "Octave: "
    etime -f '%0e' octave ttt.m 2>&1 >/dev/null ) ) |

awk '{
  times[$1] = $2
}
END {
  l = 0
  for (k in times)
    if (length(k) > l)
      l = length(k)
  l += 3
  for (k in times) {
    printf("        %s", k)
    for (i = 1; i <= l - length(k); i++)
      printf(" " )
    printf("%ss\n", times[k]);
  }
}' |

sort -k 2 -n
