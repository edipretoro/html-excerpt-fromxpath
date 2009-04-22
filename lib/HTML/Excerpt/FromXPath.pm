package HTML::Excerpt::FromXPath;

use warnings;
use strict;
use LWP::UserAgent;
use Carp;
use Encode;
use HTML::TreeBuilder::XPath;
use HTTP::Response::Encoding;

use vars qw( @ISA @EXPORT @EXPORT_OK );

use Exporter;
@ISA = qw( Exporter );
@EXPORT = (); # no export by default
@EXPORT_OK = qw( scrape ); # only scrape can be exported

=head1 NAME

HTML::Excerpt::FromXPath - Select a part of a HTML file with an XPath expression and store it

=head1 VERSION

Version 0.03

=cut

our $VERSION = '0.03';


=head1 SYNOPSIS

Scrape HTML with XPath and store this excerpt

    use HTML::Excerpt::FromXPath;

    my $scaper = HTML::Excerpt::FromXPath->new();
    my $result = $scraper->scrape( 
       url => 'http://en.wikipedia.org/wiki/Web_Scraping'
       xpath => '//main'
    );
    print $result->as_HTML;

=head1 EXPORT

=head2 scrape

=head1 FUNCTIONS

=head2 new

=cut

sub new {
    my $class = shift;
    my %args = @_;
    
    my $ua = LWP::UserAgent->new();
    my $agent = exists $args{agent} ? $args{agent} : "html-excerpt-fromxpath/$VERSION";
    $ua->agent($agent);
    
    my $self = {
        ua => $ua,
    };
    
    bless $self, $class;

    return $self;
}

=head2 scrape

=cut

sub scrape {
    my ($self, %args) = @_;

    croak "Missing url parameter" unless exists $args{url};
    my $xpath = $args{xpath} || '//html';
    
    my $response = $self->{ua}->get($args{url});
    
    if ($response->is_success) {
        my $content;
        
        if ($response->encoding) {
            $content = decode( $response->encoding, $response->content );
        } else {
            $content = $response->content;
        }

        my $tree = HTML::TreeBuilder::XPath->new_from_content( $content );
        
        my $excerpt = $tree->findnodes($xpath);
        return $excerpt;
    } else {
        croak $response->status_line;
        return;
    }
}

=head1 AUTHOR

Emmanuel Di Pretoro, C<< <edipretoro at gmail.com> >>

=head1 BUGS

Please report any bugs or feature requests to C<bug-html-excerpt-fromxpath at rt.cpan.org>, or through
the web interface at L<http://rt.cpan.org/NoAuth/ReportBug.html?Queue=HTML-Excerpt-FromXPath>.  I will be notified, and then you'll
automatically be notified of progress on your bug as I make changes.




=head1 SUPPORT

You can find documentation for this module with the perldoc command.

    perldoc HTML::Excerpt::FromXPath


You can also look for information at:

=over 4

=item * RT: CPAN's request tracker

L<http://rt.cpan.org/NoAuth/Bugs.html?Dist=HTML-Excerpt-FromXPath>

=item * AnnoCPAN: Annotated CPAN documentation

L<http://annocpan.org/dist/HTML-Excerpt-FromXPath>

=item * CPAN Ratings

L<http://cpanratings.perl.org/d/HTML-Excerpt-FromXPath>

=item * Search CPAN

L<http://search.cpan.org/dist/HTML-Excerpt-FromXPath/>

=back


=head1 ACKNOWLEDGEMENTS


=head1 COPYRIGHT & LICENSE

Copyright 2009 Emmanuel Di Pretoro, all rights reserved.

This program is free software; you can redistribute it and/or modify it
under the same terms as Perl itself.


=cut

1; # End of HTML::Excerpt::FromXPath
