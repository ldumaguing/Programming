<?php
require("fpdf/fpdf.php");

$dtz = new DateTimeZone("EDT");
$dt = new DateTime("now", $dtz);

$db = new PDO("mysql:host=localhost;dbname=ayeka", "ayeka", "");
$stmt = $db->prepare("select page, name, ssn from v_requests limit 30");
$stmt->execute();

$pdf = new FPDF('P', 'mm', 'Letter');
$aBlankLine = "                                            ";

while ($row = $stmt->fetch()) {
   $lines = explode("\n", $row[0]);
   foreach($lines as $line) {
      if(preg_match("/1 of/", $line) | preg_match("/2 of/", $line) | preg_match("/3 of/", $line)) {
         $pdf->setMargins(20.6,31.2,0);
         $pdf->addPage();
         mod_FirstLine($pdf, $line);
         $pdf->ln();
         $pdf->ln();
         $counter = $counter + 1;
         continue;
      }
      
      if (strpos($line, "Print Date:") !== false) {
			$line = substr($line, 0, 12) . $dt->format("m/d/Y") . "  " . substr($line, 24);
		}
      if (strpos($line, "SSN:") !== false) {
			$line = substr($line, 0, 10) . substr($line, 12, 13) . "  " . substr($line, 25);
		}
      if (strpos($line, "Birthdate:") !== false) {
			$line = substr($line, 0, 11) . substr($line, 13, 6) . "        " . substr($line, 25);
		}
      if (strpos($line, "Name:") !== false) {
			if (strlen($line) <= 44){
				$line = substr($line, 0, 6) . "      " . $row[1];
			} else {
				$len = 34 - strlen($row[1]);
				$line = substr($line, 0, 6) . "      " . $row[1] . substr($aBlankLine, 0, $len) . substr($line, 46);
			}
		}

      massageLine($pdf, $line);
      $pdf->ln();
   }
}

$pdf->output();

// ********************************************************************************
function massageLine($pdf, $line) {
	if (strlen($line) <= 44){
		massageColumn($pdf, $line);
	} else {
		massageColumn($pdf, substr($line, 0, 44));
		massageColumn($pdf, substr($line, 46));
	}
}

// ================================================================================
function massageColumn($pdf, $line) {
	if (preg_match("/Crs Total/", $line)){
		$line = "          Cumulative Total:" . substr($line, 27);
	}
	if (preg_match("/Trns Total/", $line)){
		$line = "            Transfer Total:" . substr($line, 27);
	}
	if (preg_match("/Course Descrip/", $line)){
		$pdf->setFont("Courier", 'U', 8);
        $pdf->cell(13.5, 3.49, "Course");
        $pdf->cell(32.4, 3.49, "Description");
        $pdf->cell(13.5, 3.49, "Attempt");
        $pdf->cell(8.3, 3.49, "Earn");
        $pdf->cell(28.3, 3.49, "Grd");
		return;
	}
	if (preg_match("/Att  Earn/", $line)){
		$pdf->cell(45.9, 3.49, " ");
		$pdf->setFont("Courier", 'U', 8);
        $pdf->cell(13.5, 3.49, "Attempt");
        $pdf->cell(8.3, 3.49, "Earn");
		return;	
	}
	if(preg_match("/---/", $line)
	| preg_match("/Fall/", $line)
	| preg_match("/Spring/", $line)
	| preg_match("/Summer/", $line)
	| preg_match("/End of Off/", $line)
	| preg_match("/DEAN'S LIST/", $line)
	| preg_match("/Beginning of U/", $line)
	| preg_match("/ACADEMIC PRO/", $line)
	| preg_match("/ACADEMIC DIS/", $line)
	| preg_match("/SPECIAL PRO/", $line)
	| preg_match("/Degrees Awa/", $line)
	| preg_match("/Transfer Cred/", $line)
	) {
	  $pdf->setFont("Courier", 'B', 8);
      $pdf->cell(96, 3.49, $line);
   } else {
	  $pdf->setFont("Courier", '', 8);
      $pdf->cell(96, 3.49, $line);
	}
}

// ********************************************************************************
function mod_FirstLine($pdf, $line) {
	$X = "                                   OFFICIAL UNDERGRADUATE TRANSCRIPT";
	$pdf->setFont("Courier", 'B', 8);
	$pdf->cell(152, 3.49, $X);
	$pdf->cell(0, 3.49, substr($line, 77));
}

?>
