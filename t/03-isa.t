#!perl -T

use Test::More;
use HTML::Excerpt::FromXPath;

plan tests => 1;

my $scraper = HTML::Excerpt::FromXPath->new();

isa_ok( $scraper, 'HTML::Excerpt::FromXPath' );
