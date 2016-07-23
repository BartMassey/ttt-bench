/*
  Perfect Tic-Tac-Toe player in JavaScript
  Copyright © 2012 Bart Massey
  [This program is licensed under the "MIT License"]
  Please see the file COPYING in the source
  distribution of this software for license terms.
*/

var board=new Array(3)
for (var r = 0; r < 3; r++) {
    board[r] = new Array(3)
    for (var c = 0; c < 3; c++)
        board[r][c] = 0
}

/*
This syntax is only supported in newer JavaScript AFAICT
board = [
  [0,  0,  0],
  [0,  0,  0],
  [0,  0,  0] ]
*/

var count
/* http://stackoverflow.com/questions/2647867 */
try {
    count = +arguments[0]
} catch(err) {
    /* SpiderMonkey is non-standard here */
    count = +scriptArgs[1]
}
print(count)
var sum_draws = negamax(1, board)
for (var i = 0; i < count; i++)
    sum_draws += negamax(1, board)
print(sum_draws)
