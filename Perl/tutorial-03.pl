#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use List::Util qw(uniq);

use v5.42;

# *************************************************************************************************
my $aTxtnNum = 'SW321';
say $aTxtnNum;
my @txts = $aTxtnNum =~ /^[A-Za-z]*/g;
say $txts[0];
@txts = $aTxtnNum =~ /[0-9]*$/g;
say $txts[0];

my @words = qw(foo bar baz foo zorg baz);
push(@words, "fish", "monger", "foo");
my @unique_words = uniq @words;

say @unique_words;



