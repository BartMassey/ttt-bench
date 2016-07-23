#!/bin/sh
# Copyright © 2015 Bart Massey
# This code is made available under the "MIT
# License". Please see the file COPYING in this distribution
# for license details.

awk '{
  if (NF == 3 && $2 + 0 >= 1) {
      if ($2 + 0 == 1 && $3 + 0.0 > 100) {
          times[$1] = $3 + 0.0
      } else {
          per_iter = sprintf("%4.2g", ($3 + 0.0) / ($2 + 0))
          signif = sprintf("%f", per_iter + 0.0)
          report = ""
          for (i = 1; i <= length(signif) - 1; i++) {
              c = substr(signif, i, 1)
              if (c != "0" && c != ".")
                  break
              report = report c
          }
          rest = substr(signif, i, 3)
          if (match(rest, "\\.") == 0 || substr(rest, 3) == ".")
              rest = substr(rest, 1, 2)
          report = report rest
          times[$1] = report
      }
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
