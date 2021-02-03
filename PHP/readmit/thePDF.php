<?php
require("fpdf/fpdf.php");

$db = new PDO("mysql:host=localhost;dbname=ayeka", "ayeka", "");
$stmt = $db->prepare("select page from v_requests limit 3");
$stmt->execute();

$pdf = new FPDF('P', 'mm', 'Letter');
$counter = 0;

while ($row = $stmt->fetch()) {
   $lines = explode("\n", $row[0]);
   foreach($lines as $line){
      if(preg_match("/1 of/", $line) | preg_match("/2 of/", $line) | preg_match("/3 of/", $line)) {
         $pdf->setMargins(20.6,31.2,0);
         $pdf->addPage();
         $pdf->setFont("Courier", '', 8);
         $pdf->cell(0, 3.49, $line);
         $pdf->ln();
         $pdf->ln();
         $counter = $counter + 1;
         continue;
      }
      $pdf->setFont("Courier", '', 8);
      $pdf->cell(0, 3.49, $line);
      $pdf->ln();
      $counter = $counter + 1;
   }
}

$pdf->output();


?>
