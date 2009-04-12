#!perl -T

use Test::More;

my @methods = qw(
);

plan tests => scalar(@methods);

foreach my $method (@methods) {
    can_ok( 'HTML::Excerpt::FromXpath', $method );
}
