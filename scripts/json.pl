#!/usr/bin/perl
use strict;
use warnings FATAL => 'all';
use utf8;
use 5.32.1;
use Carp qw/croak/;
use JSON::Parse qw/parse_json/;

my $fileDir='files';
open(my $fh, "<:encoding(UTF-8)", "$fileDir/jawiki-country.json")
    or croak('Cannot open the file!');
binmode(STDOUT, "encoding(UTF-8)");

my $count = 0;
my %country;
while (my $line = <$fh>) {
    my $data = parse_json($line);
    $country{$data->{title}} = $data->{text};
}

close $fh;

say "$country{'イギリス'}";





