<?php
   // 1. Connect (creates 'devices.DB' if it doesn't exist)
   $pdo = new PDO('sqlite:' . __DIR__ . '/devices.DB');
   $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

   // 2. Insert data safely with prepared statements
   $stmt = $pdo->prepare("INSERT INTO Foo (loginDate, username) VALUES (:loginDate, :username)");
   $stmt->execute([
      ':loginDate' => 'Jane Doe',
      ':username' => 'jane@example.com'
   ]);

   // 3. Query data
   $stmt = $pdo->query("SELECT loginDate, username FROM Foo");
   $users = $stmt->fetchAll(PDO::FETCH_ASSOC);

   print_r($users);









?>

