<?php
$handle = fopen("/fish/nmap.txt", "r");

if ($handle) {
    while (($line = fgets($handle)) !== false) {
        // Process the line (use trim() or rtrim() to remove trailing newline characters)
        echo rtrim($line, "\r\n") . PHP_EOL;
    }

    fclose($handle);
} else {
    echo "Error opening the file.";
}
?>

