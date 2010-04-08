use 5.008;
use strict;
use warnings;

package Pod::Weaver::Section::Availability;
BEGIN {
  $Pod::Weaver::Section::Availability::VERSION = '1.100980';
}

# ABSTRACT: add a AVAILABILITY pod section
use Moose;
with 'Pod::Weaver::Role::Section';
use namespace::autoclean;
use Moose::Autobox;

sub weave_section {
    my ($self, $document, $input) = @_;
    my $name = $input->{zilla}->name;
    $document->children->push(
        Pod::Elemental::Element::Nested->new(
            {   command  => 'head1',
                content  => 'AVAILABILITY',
                children => [
                    Pod::Elemental::Element::Pod5::Ordinary->new(
                        {   content => <<EOPOD,
The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see
L<http://search.cpan.org/dist/$name/>.
EOPOD
#
# The development version lives at
# L<http://github.com/hanekomu/$name/>.
# Instead of sending patches, please fork this project using the standard git
# and github infrastructure.
                        }
                    ),
                ],
            }
        ),
    );
}
1;


__END__
=pod

=head1 NAME

Pod::Weaver::Section::Availability - add a AVAILABILITY pod section

=head1 VERSION

version 1.100980

=head1 SYNOPSIS

In C<weaver.ini>:

    [Availability]

=head1 OVERVIEW

This section plugin will produce a hunk of Pod that lists known bugs and
refers to the bugtracker URL. The plugin is automatically used by the
C<@MARCEL> weaver bundle.

=head1 FUNCTIONS

=head2 weave_section

adds the C<AVAILABILITY> section.

=for test_synopsis 1;
__END__

=head1 INSTALLATION

See perlmodinstall for information and options on installing Perl modules.

=head1 BUGS AND LIMITATIONS

No bugs have been reported.

Please report any bugs or feature requests through the web interface at
L<http://rt.cpan.org/Public/Dist/Display.html?Name=Pod-Weaver-PluginBundle-MARCEL>.

=head1 AVAILABILITY

The latest version of this module is available from the Comprehensive Perl
Archive Network (CPAN). Visit L<http://www.perl.com/CPAN/> to find a CPAN
site near you, or see
L<http://search.cpan.org/dist/Pod-Weaver-PluginBundle-MARCEL/>.

=head1 AUTHOR

  Marcel Gruenauer <marcel@cpan.org>

=head1 COPYRIGHT AND LICENSE

This software is copyright (c) 2010 by Marcel Gruenauer.

This is free software; you can redistribute it and/or modify it under
the same terms as the Perl 5 programming language system itself.

=cut

