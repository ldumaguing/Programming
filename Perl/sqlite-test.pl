#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.40.3;

use DBI;
my $conn = DBI->connect("dbi:SQLite:dbname=fish.db","","");

my $stmt = q{
CREATE TABLE IF NOT EXISTS users (
   id INTEGER PRIMARY KEY AUTOINCREMENT,
   name TEXT NOT NULL,
   email TEXT UNIQUE
   );
};

$conn->do($stmt) or die $DBI::errstr;
say "Success";




