#!/usr/bin/env perl

use strict;
use warnings;
use diagnostics;
use List::Util qw(uniq);

use v5.42;

# *************************************************************************************************
my @words = qw(foo bar baz foo zorg baz);
push(@words, "fish", "monger", "foo");
my @unique_words = uniq @words;

say @unique_words;



