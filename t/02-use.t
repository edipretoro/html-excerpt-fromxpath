#!perl -T

use Test::More;
use HTML::Excerpt::FromXPath;

my @methods = qw(
  scrape
);

plan tests => scalar(@methods);

foreach my $method (@methods) {
    use_ok( 'HTML::Excerpt::FromXPath', $method );
}
