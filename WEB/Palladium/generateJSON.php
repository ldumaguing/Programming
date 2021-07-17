<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: appliction/json');

// *********************************************************************
$output = null;
$retval = null;
exec('bin/php_Image 142', $output, $retval);
$A[] = explode(';', $output[0]);

foreach ($A[0] as $a) {
	$B[] = explode("|", $a);
}

$len = sizeof($B) - 1;
unset ($B[$len]);

echo json_encode($B);

?>
