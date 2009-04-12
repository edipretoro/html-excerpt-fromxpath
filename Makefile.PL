use strict;
use warnings;
use ExtUtils::MakeMaker;

WriteMakefile(
    NAME                => 'HTML::Excerpt::FromXPath',
    AUTHOR              => 'Emmanuel Di Pretoro <edipretoro@gmail.com>',
    VERSION_FROM        => 'lib/HTML/Excerpt/FromXPath.pm',
    ABSTRACT_FROM       => 'lib/HTML/Excerpt/FromXPath.pm',
    ($ExtUtils::MakeMaker::VERSION >= 6.3002
      ? ('LICENSE'=> 'perl')
      : ()),
    PL_FILES            => {},
    PREREQ_PM => {
        'Test::More' => 0,
        'Carp' => 0,
        'LWP::UserAgent' => 0,
        'HTML::TreeBuilder::XPath' => 0,
    },
    dist                => { COMPRESS => 'gzip -9f', SUFFIX => 'gz', },
    clean               => { FILES => 'HTML-Excerpt-FromXPath-*' },
);
