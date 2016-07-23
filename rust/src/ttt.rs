// Copyright © 2015 Bart Massey
// [This program is licensed under the "MIT License"]
// Please see the file COPYING in the source
// distribution of this software for license terms.

// Perfect Tic-Tac-Toe player in Rust

extern crate ttt;
use ttt::negamax;

pub fn main() {
    let rep_str = std::env::args().nth(1).expect("missing rep count");
    let reps: u32 = rep_str.parse().expect("invalid rep count");
    let mut board: [[i32;3];3] = [[0;3];3];
    let mut sum_draws: i32 = negamax::negamax(1, &mut board);
    for _ in 1..reps {
        sum_draws += negamax::negamax(1, &mut board);
    }
    println!("{}", sum_draws);
}
