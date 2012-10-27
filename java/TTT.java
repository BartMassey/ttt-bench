/*
 * Copyright © 2012 Bart Massey
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/* Perfect Tic-Tac-Toe player in Nickle */

class TTT {

  static int board[][] = {
    {0, 0, 0},
    {0, 0, 0},
    {0, 0, 0}
  };

  public static void main(String[] args) {
    System.out.println(Negamax.negamax(1, board));
  }

}
