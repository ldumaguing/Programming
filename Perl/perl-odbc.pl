use strict;
use warnings;
use DBI;

my $dsn = "dbi:ODBC:DSN=fooness";
my $dbh = DBI->connect($dsn, 'tenchi', 'Ilo') or die "Couldn't open database: $DBI::errstr\n";
# ... execute SQL statements ...

my $sth = $dbh->prepare("select * from transcripts")
                   or die "prepare statement failed: $dbh->errstr()";


$sth->execute() or die "execution failed: $dbh->errstr()"; 
while(my @row = $sth->fetchrow()) {
    print @row;
}

$dbh->disconnect();

