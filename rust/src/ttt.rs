// Copyright © 2015 Bart Massey
// [This program is licensed under the "MIT License"]
// Please see the file COPYING in the source
// distribution of this software for license terms.

// Perfect Tic-Tac-Toe player in Rust

extern crate tttlib;
use tttlib::negamax;

pub fn main() {
    let mut board: [[i32;3];3] = [[0;3];3];
    println!("{}\n", negamax::negamax(1, &mut board));
}
