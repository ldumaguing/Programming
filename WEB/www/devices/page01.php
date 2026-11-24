<?php
   session_start();

   echo "username: " . $_SESSION['uname'] . "<br>";
   echo "loginTime: " . $_SESSION['loginTime'] . "<br>";
   echo "timeNum: " . $_SESSION['timeNum'] . "<br>";

   // 1. Connect (creates 'devices.DB' if it doesn't exist)
   $pdo = new PDO('sqlite:' . __DIR__ . '/devices.DB');
   $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

   // 2. Insert data safely with prepared statements
   $stmt = $pdo->prepare("INSERT INTO Foo (loginTime, username, timeNum) VALUES (:loginTime, :username, :timeNum)");
   $stmt->execute([
      ':loginTime' => $_SESSION['loginTime'],
      ':username' => $_SESSION['uname'],
      ':timeNum' => $_SESSION['timeNum']
   ]);

?>

