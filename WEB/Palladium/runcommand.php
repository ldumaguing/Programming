<?php
$output = null;
$retval = null;
exec('bin/createHuman', $output, $retval);
print_r($output);
print($output[2]);
?>

