//  Perfect Tic-Tac-Toe player in Go
//  Copyright © 2017 Bart Massey
//  [This program is licensed under the "MIT License"]
//  Please see the file COPYING in the source
//  distribution of this software for license terms.

package main

import (
	"fmt"
	"negamax"
	"os"
	"strconv"
)    

func main() {
	var n int
	switch len(os.Args) {
	case 1:
		n = 1
	case 2:
		if na, err := strconv.Atoi(os.Args[1]); err == nil {
			n = na
		} else {
			panic(err)
		}
	default:
		panic("usage: ttt [reps]")
	}
	var val int
	for i := 0; i < n; i++ {
		var board [3][3]int
		val = negamax.Negamax(1, &board)
	}
	fmt.Println(val)
}
