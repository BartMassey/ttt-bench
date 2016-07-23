#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

awk '{
  if (NF == 3 && ($2 ".0") + 0 >= 1) {
      per_iter = sprintf("%.2g", $3 / (($2 ".0") + 0))
      times[$1] = sprintf("%f", per_iter + 0)
  } else if (NF >= 1) {
      times[$1] = "<?>"
  }
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
