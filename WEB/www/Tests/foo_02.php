<?php
$servername = "127.0.0.1";
$username = "ayeka";
$password = "fish123fish123";
$dbname = "publications";

// Connect to the MySQL database
$conn = new mysqli($servername, $username, $password, $dbname);

$conn->close();
?>
