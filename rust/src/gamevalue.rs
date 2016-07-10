// Copyright © 2015 Bart Massey
// [This program is licensed under the "MIT License"]
// Please see the file COPYING in the source
// distribution of this software for license terms.

// Perfect Tic-Tac-Toe player in Rust

/// Returns the value of the game to the side on move if the
/// game is over, or -2 if the game is still in progress.
pub fn gamevalue(onmove: i32, board: &mut Vec<Vec<i32>>) -> i32 {
    let mut v:i32;
    // first scan for wins
    let mut side:i32 = -1;
    for _ in 0..2 {
        side = -side;
        v = side * onmove;
        // scan for diagonal
        let mut n:i32 = 0;
        for d in 0..3 {
            if board[d][d] == side {
                n += 1;
            }
        }
        if n == 3 {
            return v;
        }
        // scan for opposite diagonal
        n = 0;
        for d in 0..3 {
            if board[d][2 - d] == side {
                n += 1;
            }
        }
        if n == 3 {
            return v;
        }
        // scan for rows
        for r in 0..3 {
            n = 0;
            for c in 0..3 {
                if board[r][c] == side {
                    n += 1;
                }
            }
            if n == 3 {
                return v;
            }
        }
        // scan for columns
        for c in 0..3 {
            n = 0;
            for r in 0..3 {
                if board[r][c] == side {
                    n += 1;
                }
            }
            if n == 3 {
                return v;
            }
        }
    }
    // scan for blanks
    for r in 0..3 {
        for c in 0..3 {
            if board[r][c] == 0 {
                // game not over */
                return -2;
            }
        }
    }
    // game is a draw
    0
}
