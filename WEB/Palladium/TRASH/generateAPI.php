<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: appliction/json');

$anArray = array(
   'A' => 'Moe',
   'B' => 'Curly',
   'C' => 'Larry'
);

// echo json_encode($anArray);

// *********************************************************************
$craps = "A;B;C";
$A[] = explode(';', $craps);

$craps = "a;b;c";
$A[] = explode(';', $craps);


echo json_encode($A);



?>
