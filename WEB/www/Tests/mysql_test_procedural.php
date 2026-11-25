<?php
$host = '127.0.0.1';
$user = 'ayeka';
$pass = 'fish123fish123';
$db   = 'publications';

$conn = mysqli_connect($host, $user, $pass, $db);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

mysqli_set_charset($conn, "utf8mb4");
echo "Connected successfully!";
?>

