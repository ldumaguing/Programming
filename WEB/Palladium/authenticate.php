<?php
session_start();
$_SESSION['username'] = $_POST['username'];
$_SESSION['password'] = $_POST['password'];
$user = $_SESSION['username'];
$pass = $_SESSION['password'];

$db = new mysqli("localhost", "vee", "B100dmoney", "Palladium");

$stmt = "select * from users where username = '" . $user . "' and password = '" . $pass . "'";
echo $stmt . "<br \>";

$result = $db->query($stmt);
if ($result->num_rows > 0)
   header('Location: bbb.php');
else
   echo "no";



$db->close();

?>
<!doctype html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>Palladium</title>
	</head>
	<body>
		<form name="Login Page" action="aaa.php" method="post">
			<input type="submit" name="submit" value="Login">
		</form>
	</body>
</html>
