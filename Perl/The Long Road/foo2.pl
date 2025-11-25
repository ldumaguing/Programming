#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

use DBI;
my $conn = DBI->connect("dbi:SQLite:dbname=TLR.db","","");

my $stmt = $conn->prepare("SELECT * FROM img");
$stmt->execute();

while (my @row = $stmt->fetchrow_array()) {
   say $row[0] . ", " . $row[1];
}
$stmt->finish();



