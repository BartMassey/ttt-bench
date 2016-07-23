/*
 * Copyright © 2012 Bart Massey
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/* Perfect Tic-Tac-Toe player in Nickle */

#include <stdio.h>
#include <stdlib.h>

extern int negamax(int, int[3][3]);

int board[3][3];

int main(int argc, char **argv) {
    int reps = 1;
    if (argc > 0)
        reps = atoi(argv[1]);
    volatile int j;
    for (int i = 0; i < reps; i++) {
        asm("cpuid" ::: "rax", "rbx", "rcx", "rdx");
        j = negamax(1, board);
    }
    printf("%d\n", j);
    return 0;
}
