# Perfect Tic-Tac-Toe player in Python
# Copyright © 2012 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

from negamax import *

board = [
  [0,  0,  0],
  [0,  0,  0],
  [0,  0,  0] ]

print(negamax(1, board))
