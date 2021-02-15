use strict;
use warnings;
use utf8;
use Test::More;
use Char1::01_get;

my $test = "パタトクカシーー";

my $output = Char1::01_get::getAtIndex($test, 0, 2, 4, 6);

is $output, "パトカー";

done_testing();

