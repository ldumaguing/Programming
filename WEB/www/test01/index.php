<?php
session_start();

if (isset($_SERVER['PHP_AUTH_USER']) && isset($_SERVER['PHP_AUTH_PW'])
	&& ldap_authenticate($_SERVER['PHP_AUTH_USER'], $_SERVER['PHP_AUTH_PW'])) {
    	# echo "Welcome User: " . htmlspecialchars($_SERVER['PHP_AUTH_USER']) .
	#" Password: " . htmlspecialchars($_SERVER['PHP_AUTH_PW']);

	session_regenerate_id(true);
	$_SESSION['fname'] = $_SERVER['PHP_AUTH_USER'];
	$_SESSION['lname'] = $_SERVER['PHP_AUTH_PW'];
	$_SESSION['mine'] = session_id();

	header('Location: page01.php');
} else {
	header('WWW-Authenticate: Basic realm="Restricted Area"');
	header('HTTP/1.1 401 Unauthorized');
	die("Please enter your username and password");
}


# ****************************************************************************************
function ldap_authenticate($a, $b) {
	$ldapconn = ldap_connect("ldaps://wnvmdcscith01.bmcc.cuny.edu", 636) or die("Could not connect to LDAP server.");

	if ($ldapconn) {
		ldap_set_option($ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);
		ldap_set_option($ldapconn, LDAP_OPT_REFERRALS, 0);
		
		// binding to ldap server
		$ldapbind = ldap_bind($ldapconn, 'bmcc\\' . $a, $b);

		// verify binding
		if ($ldapbind) {
			return true;
		} else {
			return false;
	}
}
	echo '<br>';
	return true;
}
?>

