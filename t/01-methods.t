#!perl -T

use Test::More;
use HTML::Excerpt::FromXPath;

my @methods = qw(
  new
  scrape
);

plan tests => scalar(@methods);

foreach my $method (@methods) {
    can_ok( 'HTML::Excerpt::FromXPath', $method );
}
