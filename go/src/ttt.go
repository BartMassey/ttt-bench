//  Perfect Tic-Tac-Toe player in Go
//  Copyright © 2017 Bart Massey
//  [This program is licensed under the "MIT License"]
//  Please see the file COPYING in the source
//  distribution of this software for license terms.

package main

import (
	"fmt"
	"negamax"
)    

func main() {
	var board [3][3]int
	val := negamax.Negamax(1, board)
	fmt.Println(val)
}
