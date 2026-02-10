use DBI;
my $dsn = "dbi:ODBC:fooness";
my $user = "tenchi";
my $password = "xxxxx";

my $dbh = DBI->connect($dsn, $user, $password) or die "Couldn't open database: $DBI::errstr\\n";
# ... execute SQL statements ...
$dbh->disconnect();

