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

    is(Char1::TextFunc::wordCount($test), "314159265358979", 'test 03_wordCount ok');
};

subtest "04_element" => sub {
    my $test = "Hi He Lied Because Boron Could Not Oxidize Fluorine. New Nations Might Also Sign Peace Security Clause. Arthur King Can.";
    my %output = Char1::TextFunc::element($test);
    my $expected = {
        H  => 1,
        He => 2,
        Li => 3,
        Be => 4,
        B  => 5,
        C  => 6,
        N  => 7,
        O  => 8,
        F  => 9,
        Ne => 10,
        Na => 11,
        Mi => 12,
        Al => 13,
        Si => 14,
        P  => 15,
        S  => 16,
        Cl => 17,
        Ar => 18,
        K  => 19,
        Ca => 20,
    };

    is_deeply(\%output, $expected, 'test 04_element ok');
};

subtest "05_n-gram" => sub {
    my $test = "I am an NLPer";
    my @got = Char1::TextFunc::n_gram($test, 2, 0);
    my @expected_char = ("I ", " a", "am", "m ", " a", "an", "n ", " N", "NL", "LP", "Pe", "er");

    is_deeply(\@got, \@expected_char, 'test 05_n-gram by char ok');

    @got = Char1::TextFunc::n_gram($test, 2, 1);
    my @expected_word = (
        [ "I", "am" ],
        [ "am", "an" ],
        [ "an", "NLPer" ],
    );
    is_deeply(\@got, \@expected_word, 'test 05_n-gram by word ok');
};

subtest "06_set" => sub {
    my ($test_a, $test_b) = ("12345", "34567");

    my @actual = Char1::TextFunc::union($test_a, $test_b);
    my $expected = [ "12", "23", "34", "45", "56", "67" ];
    is_deeply(\@actual, $expected, 'test 06_union ok');

    @actual = Char1::TextFunc::intersection($test_a, $test_b);
    $expected = [ "34", "45" ];
    is_deeply(\@actual, $expected, 'test 06_intersection ok');

    @actual = Char1::TextFunc::complement($test_a, $test_b, 3);
    $expected = [ "123", "234" ];
    is_deeply(\@actual, $expected, 'test 06_complement ok');
};

subtest "07_template" => sub {
    my $actual = Char1::TextFunc::template(12, "気温", 22.4);
    my $expected = "12時の気温は22.4";

    is($actual, $expected, 'test 07_template ok');
};

done_testing();

