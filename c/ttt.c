/*
 * Copyright © 2012 Bart Massey
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/* Perfect Tic-Tac-Toe player in Nickle */

#include <stdio.h>

extern int negamax(int, int[3][3]);

int board[3][3];

int main() {
    printf("%d\n", negamax(1, board));
    return 0;
}
