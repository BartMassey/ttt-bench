/*
 * Copyright © 2012 Bart Massey
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/* Perfect Tic-Tac-Toe player in Nickle */

class TTT {

  static boolean timing_loop = true;

  static int board[][] = {
    {0, 0, 0},
    {0, 0, 0},
    {0, 0, 0}
  };

  public static void main(String[] args) {
    int sum_draws = Negamax.negamax(1, board);
    if (timing_loop)
        for (int i = 1; i < 10; i++)
            sum_draws += Negamax.negamax(1, board);
    System.out.println(sum_draws);
  }

}
