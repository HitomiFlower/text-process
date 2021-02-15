use strict;
use warnings;
use Test::More;
use utf8;

use Char1::TextFunc;

subtest "00_rev" => sub {
    my $test = "stressed";

    is(Char1::TextFunc::rev($test), "desserts", 'test 00_rev ok');

};

subtest "01_getAtIndex" => sub {
    my $test = "パタトクカシーー";

    is(Char1::TextFunc::getAtIndex($test, 0, 2, 4, 6), "パトカー", 'test 01_getAtIndex ok');

};

subtest "02_concat" => sub {
    my $left = "パトカー";
    my $right = "タクシー";

    is(Char1::TextFunc::concat($left, $right), "パタトクカシーー", 'test 02_concat ok');
};

subtest "03_wordCount" => sub {
    my $test = "Now I need a drink, alcoholic of course, after the heavy lectures involving quantum mechanics.";

    is(Char1::TextFunc::wordCount($test), "31415092605358979", 'test 03_wordCount ok');
};

done_testing();

