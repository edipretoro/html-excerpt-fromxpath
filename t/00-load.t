#!perl -T

use Test::More tests => 1;

BEGIN {
	use_ok( 'HTML::Excerpt::FromXPath' );
}

diag( "Testing HTML::Excerpt::FromXPath $HTML::Excerpt::FromXPath::VERSION, Perl $], $^X" );
