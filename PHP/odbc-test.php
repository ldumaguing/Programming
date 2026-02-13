<?php
// $db = new PDO('odbc:Driver=FreeTDS;Server=host;Port=port;Database=database;UID=user;PWD=pass;');


$dsn = "odbc:Driver=FreeTDS;Server=vssqldmb01.bmcc.cuny.edu;Port=1433;Database=Tenchi;"; // DSN_NAME is the name of your configured DSN
$user = "tenchi";
$password = "xxx";
$options = [
    PDO::ATTR_ERRMODE            => PDO::ERRMODE_EXCEPTION, // Throw exceptions on errors
    PDO::ATTR_DEFAULT_FETCH_MODE => PDO::FETCH_ASSOC,       // Default to associative arrays
    PDO::ATTR_EMULATE_PREPARES   => false,                  // Use native prepared statements
];
try {
    $conn = new PDO($dsn, $user, $password, $options);
    // $conn = new PDO($dsn, $user, $password);
    echo "Connection successful!";
  
    $stmt = $conn->query("SELECT name FROM transcripts");
    while ($row = $stmt->fetch()) {
        echo $row['name'] . "\n";
    }



} catch (PDOException $e) {
    die("Unable to connect: " . $e->getMessage());
}


?>


