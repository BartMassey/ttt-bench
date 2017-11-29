// Perfect Tic-Tac-Toe player in Go
// Copyright © 2017 Bart Massey
// [This program is licensed under the "MIT License"]
// Please see the file COPYING in the source
// distribution of this software for license terms.

package negamax

import "gamevalue"

// Pseudocode:

// To calculate the negamax value of a position s:
//    If s is a final state (game over)
//        return the value of s to the side on move
//    v <- -1
//    for each legal move m in s
//       s' <- m(s)
//       v' <- -negamax(s')
//       if v' > v
//           v <- v'
//    return v

func Negamax(onmove int, board [3][3]int) int {
	v := gamevalue.GameValue(onmove, board)
	if v != -2 {
		// game is over
		return v
	}
	v = -1
	for r := 0; r < 3; r++ {
		for c := 0; c < 3; c++ {
			if board[r][c] == 0 {
				board[r][c] = onmove
				v0 := -Negamax(-onmove, board)
				if v0 > v {
					v = v0
				}
			}
			board[r][c] = 0
		}
	}
	return v
}
