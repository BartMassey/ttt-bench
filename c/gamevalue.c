/*
 * Copyright © 2012 Bart Massey
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/* Perfect Tic-Tac-Toe player in C */

/*
  Returns the value of the game to the
  side on move if the game is over, or
  -2 if the game is still in progress.
*/
int gamevalue(int onmove, int board[3][3]) {
  int v;
  /* first scan for wins */
  int side = -1;
  for (int s = 0; s < 2; s++) {
    side = -side;
    v = side * onmove;
    /* scan for diagonal */
    int n = 0;
    for (int d = 0; d < 3; d++)
      if (board[d][d] == side)
        n = n + 1;
    if (n == 3)
      return v;
    /* scan for opposite diagonal */
    n = 0;
    for (int d = 0; d < 3; d++)
      if (board[d][2 - d] == side)
        n = n + 1;
    if (n == 3)
      return v;
    /* scan for rows */
    for (int r = 0; r < 3; r++) {
      n = 0;
      for (int c = 0; c < 3; c++)
        if (board[r][c] == side)
          n = n + 1;
      if (n == 3)
        return v;
    }
    /* scan for columns */
    for (int c = 0; c < 3; c++) {
      n = 0;
      for (int r = 0; r < 3; r++)
        if (board[r][c] == side)
          n = n + 1;
      if (n == 3)
        return v;
    }
  }
  /* scan for blanks */
  for (int r = 0; r < 3; r++)
    for (int c = 0; c < 3; c++)
      if (board[r][c] == 0)
        /* game not over */
        return -2;
  /* game is a draw */
  return 0;
}
