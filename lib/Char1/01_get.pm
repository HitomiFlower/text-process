package Char1::01_get;
use strict;
use warnings FATAL => 'all';
use utf8;

sub getAtIndex {
    my ($got, @indexs) = @_;
    my $output;
    for my $index (@indexs) {
        $output .= substr($got, $index, 1);
    }
    return $output;
}

1;