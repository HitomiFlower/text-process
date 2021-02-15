#!/usr/bin/perl
use strict;
use warnings;
use Test::More;
use Char1::00_reverse;

my $test = "stressed";

is Char1::00_reverse::rev($test), "desserts";

done_testing();
