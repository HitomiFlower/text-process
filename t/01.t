use strict;
use warnings;
use utf8;
use Test::More;
use Char1::01_get;

subtest "getAtIndex" => sub {
    my $test = "パタトクカシーー";

    my $output = Char1::01_get::getAtIndex($test, 0, 2, 4, 6);

    is $output, "パトカー";
};

subtest "concat" => sub {
    my $left = "パトカー";
    my $right = "タクシー";

    is Char1::01_get::concat($left, $right), "パタトクカシーー";
};

done_testing();

