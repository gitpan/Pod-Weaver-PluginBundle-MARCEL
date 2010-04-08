
use strict;
use warnings;

 BEGIN { require 5.008; } 

use ExtUtils::MakeMaker 6.31;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Pod::Weaver::PluginBundle::MARCEL',
                       'DISTNAME' => 'Pod-Weaver-PluginBundle-MARCEL',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.31'
                                               },
                       'AUTHOR' => 'Marcel Gruenauer <marcel@cpan.org>',
                       'BUILD_REQUIRES' => {
                                             'Scalar::Util' => '0',
                                             'Test::More' => '0.94',
                                             'English' => '0',
                                             'File::Find' => '0',
                                             'File::Temp' => '0',
                                             'Carp' => '0'
                                           },
                       'ABSTRACT' => 'build POD documentation like MARCEL',
                       'EXE_FILES' => [],
                       'VERSION' => '1.100980',
                       'PREREQ_PM' => {
                                        'namespace::autoclean' => '0',
                                        'Pod::Weaver::Role::Section' => '0',
                                        'Moose::Autobox' => '0',
                                        'Pod::Weaver::Section::CollectWithAutoDoc' => '0',
                                        'Pod::Weaver::Config::Assembler' => '0',
                                        'Pod::Weaver::Section::Installation' => '0',
                                        'Moose' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{BUILD_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.56) };

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



