use DBI;
use DBD::MariaDB;
use v5.42;

# Database connection details
my $database = "luciano";
my $host     = "192.168.1.181";
my $port     = "3306";
my $user     = "tenchi";
my $password = "Il";


my $dsn = "DBI:MariaDB:database=$database;host=$host;port=$port";



# Connect to the database
my $dbh = DBI->connect($dsn, $user, $password, {
    RaiseError         => 1,  # Causes Perl to die on errors
    AutoCommit         => 0,  # Manually control transactions if needed
}) or die $DBI::errstr;











my $stmt = "select * from accounts";
my $sth = $dbh->prepare($stmt);
$sth->execute();

while(my @row = $sth->fetchrow_array()) {
   say @row;
}
















$dbh->disconnect();

