#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

use DBI;
my $conn = DBI->connect( "dbi:SQLite:dbname=TLR.db", "", "" );

my $stmt = $conn->prepare("SELECT * FROM img WHERE flag1 = 0 order by id");
$stmt->execute();

my $pre_text = q{
<!DOCTYPE html>
<html>
   <head>
      <meta charset="UTF-8">
      <title>The Long Road</title>
   </head>
   <body>
      <table>
};

my $post_text = q{
      </table>
   </body>
</html>
};

# ***************************************************************************************
say $pre_text;
while ( my @row = $stmt->fetchrow_array() ) {
    say "<tr><td>"
      . $row[0]
      . "</td><td><img src=\"TLR/"
      . $row[1]
      . "\"></td></tr>";
}
say $post_text;

$stmt->finish();

$conn->disconnect();

