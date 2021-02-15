#!/usr/bin/perl
package Char1::00_reverse;
use strict;
use warnings FATAL => 'all';

sub rev {
    my $got = shift;
    $got = reverse $got;
}

1;
