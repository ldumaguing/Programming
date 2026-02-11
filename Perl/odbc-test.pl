use DBI;
my $dsn = "dbi:ODBC:fooness";
my $user = "tenchi";
my $password = "xxxxxx";

use v5.42;

my $dbh = DBI->connect($dsn, $user, $password) or die "Couldn't open database: $DBI::errstr\\n";



my $stmt = "select * from transcripts";
my $sth = $dbh->prepare($stmt);
$sth->execute();

while(my @row = $sth->fetchrow_array()) {
   say @row;
}



$sth->finish();
$dbh->disconnect();


# ***************************************************************************************
/usr/local/etc/odbcinst.ini
===========================
[FreeTDS]
Description     = Free Sybase & MS SQL Driver
Driver          = /usr/local/lib/libtdsodbc.so
Port            = 1433



/usr/local/etc/odbc.ini
=======================
[fooness]
Description = Fishing IT
Driver = FreeTDS
Server = vssqldmb01.bmcc.cuny.edu
Port = 1433
Database = Tenchi



