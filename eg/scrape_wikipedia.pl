#!/usr/bin/env perl -w

use strict;
use warnings;

use lib './../lib';
use HTML::Excerpt::FromXPath;

my $scraper = HTML::Excerpt::FromXPath->new();

my $uri = shift or die "Usage: $0 http://*.wikipedia.org/wiki/Page\n";

die "$0 only handle URI from Wikipedia websites\n"
  unless $uri =~ /^http:\/\/*.wikipedia.org\/wiki\//;

my $page = $scraper->scrape(
    url   => $uri,
    xpath => '//div[@id="content"]'
);

print $page->as_HTML . "\n";

