<?php
header('Access-Control-Allow-Origin: *');
header('Content-Type: appliction/json');

$anArray = array(
   'A' => 'Moe',
   'B' => 'Curly',
   'C' => 'Larry'
);

echo json_encode($anArray);
?>
