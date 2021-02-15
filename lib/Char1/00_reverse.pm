#!/usr/bin/perl
package Char1::00_reverse;
use strict;
use warnings FATAL => 'all';

sub rev {
    reverse shift;
}

1;
