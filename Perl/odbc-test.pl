use DBI;
# DSN (Data Source Name) must match the name configured in your odbc.ini or ODBC Administrator
my $dsn = "dbi:MariaDB:database=luciano;host=192.168.1.181"; 
my $user = "tenchi";
my $password = "xxx";

use v5.42;

my $dbh = DBI->connect($dsn, $user, $password) or die "Couldn't open database: $DBI::errstr\\n";


my $stmt = "select * from accounts";
my $sth = $dbh->prepare($stmt);
$sth->execute();

while(my @row = $sth->fetchrow_array()) {
   say @row;
}



$sth->finish();
$dbh->disconnect();




