<?php
/*
 * Copyright © 2016 Matthew Slocum
 * [This program is licensed under the "MIT License"]
 * Please see the file COPYING in the source
 * distribution of this software for license terms.
 */

/* Perfect Tic-Tac-Toe player in PHP */

include "negamax.php";

$board = array(array(0,0,0),
               array(0,0,0),
               array(0,0,0));

$reps = 1;
if (isset($argv[1])) {
    $reps = $argv[1];
}
$j;
for($i=0; $i<$reps; $i++) {
    $j = negamax(1, $board);
}
echo $j,"\n";

?>
