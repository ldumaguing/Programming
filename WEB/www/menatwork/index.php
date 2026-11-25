<?php
session_start();

if (isset($_SERVER['PHP_AUTH_USER'])
   && isset($_SERVER['PHP_AUTH_PW'])
	&& ldap_authenticate($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW'])) {

	session_regenerate_id(true);
	$_SESSION['uname'] = $_SERVER['PHP_AUTH_USER'];
   $_SESSION['sessId'] = session_id();

   $utc = new DateTimeImmutable('', new DateTimeZone('UTC'));
   $local = $utc->setTimezone(new DateTimeZone('America/New_York'));
   $_SESSION['loginTime'] = $local->format('Y-m-d H:i:s T'); // 2026-11-24 12:31:00 EST
   $_SESSION['timeNum'] = $utc->getTimestamp();

	header('Location: page01.php');
} else {
	header('WWW-Authenticate: Basic realm="Restricted Area"');
	header('HTTP/1.1 401 Unauthorized');
	die("Please enter your username and password");
}


# ****************************************************************************************
function ldap_authenticate($a, $b) {
	return true;
}
?>

