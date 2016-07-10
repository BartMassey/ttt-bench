// Copyright © 2015 Bart Massey
// [This program is licensed under the "MIT License"]
// Please see the file COPYING in the source
// distribution of this software for license terms.

// Perfect Tic-Tac-Toe player in Rust

extern crate ttt;
use ttt::negamax;

pub fn main() {
    let mut board: Vec<Vec<i32>> = vec![vec![0;3];3];
    let mut sum_draws: i32 = negamax::negamax(1, &mut board);
    for _ in 1..1000 {
        sum_draws += negamax::negamax(1, &mut board);
    }
    println!("{}\n", sum_draws);
}
