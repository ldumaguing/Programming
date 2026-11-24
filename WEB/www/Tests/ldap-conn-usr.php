<?php

// using ldap bind
$ldaprdn  = "bmcc\\ldumaguing";     // ldap rdn or dn
$ldappass = "IamMilla(2019h)[]";  // associated password

// connect to ldap server
$ldapconn = ldap_connect("ldaps://wnvmdcscith01.bmcc.cuny.edu", 636)
    or die("Could not connect to LDAP server.");

if ($ldapconn) {
    ldap_set_option($ldapconn, LDAP_OPT_PROTOCOL_VERSION, 3);
    ldap_set_option($ldapconn, LDAP_OPT_REFERRALS, 0);
    // binding to ldap server
    $ldapbind = ldap_bind($ldapconn, $ldaprdn, $ldappass);

    // verify binding
    if ($ldapbind) {
        echo "LDAP bind successful...";
    } else {
        echo "LDAP bind failed...";
    }

}

?>
