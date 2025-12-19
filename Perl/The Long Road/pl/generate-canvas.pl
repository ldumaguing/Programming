#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;

use v5.42;

# ***************************************************************************************
use DBI;
our $conn = DBI->connect( "dbi:SQLite:dbname=db/TLR.db", "", "" );





$conn->disconnect();



