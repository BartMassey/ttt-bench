// Copyright © 2015 Bart Massey
// [This program is licensed under the "MIT License"]
// Please see the file COPYING in the source
// distribution of this software for license terms.

// Perfect Tic-Tac-Toe player in Rust

//  Pseudocode:
//
//  To calculate the negamax value of a position s:
//     If s is a final state (game over)
//         return the value of s to the side on move
//     v <- -1
//     for each legal move m in s
//        s' <- m(s)
//        v' <- -negamax(s')
//        if v' > v
//            v <- v'
//     return v

use gamevalue;

pub fn negamax(onmove: i32, board: &mut[[i32;3];3]) -> i32 {
    let mut v:i32 = gamevalue::gamevalue(onmove, board);
    if v != -2 {
        /* game is over */
        return v;
    }
    v = -1;
    for r in 0..3 {
        for c in 0..3 {
            if board[r][c] == 0 {
                board[r][c] = onmove;
                let v0 = -negamax(-onmove, board);
                if v0 > v {
                    v = v0;
                }
                board[r][c] = 0;
            }
        }
    }
    v
}
