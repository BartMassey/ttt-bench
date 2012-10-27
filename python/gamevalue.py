# Perfect Tic-Tac-Toe player in Python
# Copyright © 2012 Bart Massey
# [This program is licensed under the "MIT License"]
# Please see the file COPYING in the source
# distribution of this software for license terms.

# Returns the value of the game to the
# side on move if the game is over, or
# -2 if the game is still in progress.
def gamevalue(onmove, board):
  # first scan for wins
  side = -1
  for s in range(2):
    side = -side
    v = side * onmove
    # scan for diagonal
    n = 0
    for d in range(3):
      if board[d][d] == side:
        n = n + 1
    if n == 3:
      return v
    # scan for opposite diagonal
    n = 0
    for d in range(3):
      if board[d][2 - d] == side:
        n = n + 1
    if n == 3:
      return v
    # scan for rows
    for r in range(3):
      n = 0
      for c in range(3):
        if board[r][c] == side:
          n = n + 1
      if n == 3:
        return v
    # scan for columns
    for c in range(3):
      n = 0
      for r in range(3):
        if board[r][c] == side:
          n = n + 1
      if n == 3:
        return v
  # scan for blanks
  for r in range(3):
    for c in range(3):
      if board[r][c] == 0:
        # game not over
        return -2
  # game is a draw
  return 0

