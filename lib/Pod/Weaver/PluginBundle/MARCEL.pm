use 5.008;
use strict;
use warnings;

package Pod::Weaver::PluginBundle::MARCEL;
our $VERSION = '1.100690';
# ABSTRACT: build POD documentation like MARCEL

use namespace::autoclean;

use Pod::Weaver::Config::Assembler;
sub _exp { Pod::Weaver::Config::Assembler->expand_package($_[0]) }

sub mvp_bundle_config {
  return (
    [ '@Default/CorePrep',  _exp('@CorePrep'), {} ],
    [ '@Default/Name',      _exp('Name'),      {} ],
    [ '@Default/Version',   _exp('Version'),   {} ],

    [ '@Default/prelude',   _exp('Region'),    { region_name => 'prelude'  } ],
    [ 'SYNOPSIS',           _exp('Generic'),   {} ],
    [ 'DESCRIPTION',        _exp('Generic'),   {} ],
    [ 'OVERVIEW',           _exp('Generic'),   {} ],

    [ 'ATTRIBUTES',         _exp('Collect'),   { command => 'attr'     } ],
    [ 'METHODS',            _exp('Collect'),   { command => 'method'   } ],
    [ 'FUNCTIONS',          _exp('Collect'),   { command => 'function' } ],

    [ '@Default/Leftovers', _exp('Leftovers'), {} ],

    [ '@Default/postlude',  _exp('Region'),    { region_name => 'postlude' } ],

    [ '@Default/Installation', _exp('Installation'), {} ],
    [ '@Default/Authors',      _exp('Authors'),      {} ],
    [ '@Default/Legal',        _exp('Legal'),        {} ],
  )
}

1;


__END__
=pod

=head1 NAME

Pod::Weaver::PluginBundle::MARCEL - build POD documentation like MARCEL

=head1 VERSION

version 1.100690

=head1 DESCRIPTION

This is the bundle used by default for my distributions. It is nearly
equivalent to the following:

    [@CorePrep]

    [Name]
    [Version]

    [Region  / prelude]

    [Generic / SYNOPSIS]
    [Generic / DESCRIPTION]
    [Generic / OVERVIEW]

    [Collect / ATTRIBUTES]
    command = attr

    [Collect / METHODS]
    command = method

    [Collect / FUNCTIONS]
    command = function

    [Leftovers]

    [Region  / postlude]

    [Installation]
    [Authors]
    [Legal]

=head1 FUNCTIONS

=head2 mvp_bundle_config

Defines the bundle's contents.

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 AUTHOR

  Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

