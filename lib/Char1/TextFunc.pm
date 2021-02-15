package Char1::TextFunc;
use strict;
use warnings FATAL => 'all';
use utf8;

# 00. 文字列の逆順
sub rev {
    reverse shift;
}

# 01. 「パタトクカシーー」
# Get characters in assign index(s)
sub getAtIndex {
    my ($got, @indexs) = @_;
    my $output;
    for my $index (@indexs) {
        $output .= substr($got, $index, 1);
    }
    return $output;
}

# 02. 「パトカー」＋「タクシー」＝「パタトクカシーー」
# Concat two same length strings
sub concat {
    my ($left, $right) = @_;
    my $output;
    for (my $i = 0; $i < length $left; $i++) {
        $output .= getAtIndex($left, $i) . getAtIndex($right, $i);
    }
    return $output;
}

# 03. 円周率
# Return the length list of word count in the string
sub wordCount {
    my $got = shift;
    my @words = split /\W/, $got;
    my $output;
    for my $word (@words) {
        $output .= length $word;
    }
    return $output;
}

1;