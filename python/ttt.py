# Perfect Tic-Tac-Toe player in Python
# Copyright (c) 2012 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

from negamax import *
from sys import argv

board = [
  [0,  0,  0],
  [0,  0,  0],
  [0,  0,  0] ]

reps = 1
if len(argv) > 1:
    reps = int(argv[1])
for _ in range(reps):
    n = negamax(1, board)
print(n)
