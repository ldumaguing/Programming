<?php
require ("fpdf/fpdf.php");

$pdf = new FPDF();
$pdf->addPage();

$pdf->setFont("Arial", "B", 16);
$pdf->cell(-10, -10, "Hello, Tsuga Hisa");
$pdf->output();

?>
