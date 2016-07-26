<?php
/*
 * Copyright © 2016 Matthew Slocum
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/* Perfect Tic-Tac-Toe player in PHP */

/*
  Returns the value of the game to the
  side on move if the game is over, or
  -2 if the game is still in progress.
*/
function gamevalue($onmove, &$board) {
    $v;
    /* first scan for wins */
    $side = -1;
    for ($s = 0; $s < 2; $s++) {
        $side = -$side;
        $v = $side * $onmove;
        /* scan for diagonal */
        $n = 0;
        for ($d = 0; $d < 3; $d++) {
            if ($board[$d][$d] == $side) {
                $n = $n + 1;
            }
        }
        if ($n == 3) {
            return $v;
        }
        /* scan for opposite diagonal */
        $n = 0;
        for ($d = 0; $d < 3; $d++) {
            if ($board[$d][2 - $d] == $side) {
              $n = $n + 1;
            }
        }
        if ($n == 3) {
            return $v;
        }
        /* scan for rows */
        for ($r = 0; $r < 3; $r++) {
            $n = 0;
            for ($c = 0; $c < 3; $c++) {
                if ($board[$r][$c] == $side) {
                    $n = $n + 1;
                }
            }
            if ($n == 3) {
                return $v;
            }
        }
        /* scan for columns */
        for ($c = 0; $c < 3; $c++) {
            $n = 0;
            for ($r = 0; $r < 3; $r++) {
                if ($board[$r][$c] == $side) {
                    $n = $n + 1;
                }
            }
            if ($n == 3)
                return $v;
        }
    }
    /* scan for blanks */
    for ($r = 0; $r < 3; $r++) {
        for ($c = 0; $c < 3; $c++) {
            if ($board[$r][$c] == 0) {
                /* game not over */
                return -2;
            }
            /* game is a draw */
            return 0;
        }
    }
}
 ?>
