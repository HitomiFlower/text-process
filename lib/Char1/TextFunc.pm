package Char1::TextFunc;
use strict;
use warnings FATAL => 'all';
use utf8;
use 5.32.1;

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
    my @words = split /\W+/, $got;
    my $output;
    for my $word (@words) {
        $output .= length $word;
    }
    return $output;
}

# 04. 元素記号
sub element {
    my @words = split /\W+/, shift;
    my %single = map {$_ => 1} qw/1 5 6 7 8 9 15 16 19/;
    my %output;
    for my $i (0 .. scalar(@words) - 1) {
        if (exists $single{$i + 1}) {
            $output{substr($words[$i], 0, 1)} = $i + 1;
        }
        else {
            $output{substr($words[$i], 0, 2)} = $i + 1;
        }
    }
    return %output;
}

# 05. n-gram
# ref https://qiita.com/kazmaw/items/4df328cba6429ec210fb
sub n_gram {
    my ($str, $n, $by_word) = @_;
    my @output;

    if ($by_word) {
        my @words = split /\s+/, $str;
        my $slen = scalar @words;
        for (my $i = 0; $i < $slen - $n + 1; $i++) {
            push @output, [ @words[$i .. $i + $n - 1] ];
        }
    }
    else {
        my $slen = length $str;
        for (my $i = 0; $i < $slen - $n + 1; $i++) {
            push @output, substr($str, $i, $n);
        }
    }
    return @output;
}

# 06. 集合
# ref https://blog.kteru.net/perl-array-sum-differentce-product/
# 和集合
sub union {
    my ($a, $b, $n) = @_;
    $n ||= 2;
    say "$n";
    my @a = n_gram($a, $n, 0);
    my @b = n_gram($b, $n, 0);

    my %cnt = ();
    my @array = grep {++$cnt{$_} == 1} (@a, @b);
}

# 積集合
sub intersection {
    my ($a, $b, $n) = @_;
    $n ||= 2;
    my @a = n_gram($a, $n, 0);
    my @b = n_gram($b, $n, 0);

    my %cnt = ();
    my @array = grep {++$cnt{$_} == 2} (@a, @b);
}

# 差集合
sub complement {
    my ($a, $b, $n) = @_;
    $n ||= 2;
    my @a = n_gram($a, $n, 0);
    my @b = n_gram($b, $n, 0);

    my %cnt = ();
    map {$cnt{$_}--} @b;
    my @array = grep {++$cnt{$_} == 1} @a
}

# 07. テンプレートによる文生成
sub template {
    my ($a, $b, $c) = @_;

    use constant TEMP => "%s時の%sは%s";

    sprintf(TEMP, $a, $b, $c);
}

1;