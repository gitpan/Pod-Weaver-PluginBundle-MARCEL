
use strict;
use warnings;

 BEGIN { require 5.008; } 

use ExtUtils::MakeMaker 6.11;



my %WriteMakefileArgs = (
                       'test' => {
                                   'TESTS' => 't/*.t'
                                 },
                       'NAME' => 'Pod::Weaver::PluginBundle::MARCEL',
                       'DISTNAME' => 'Pod-Weaver-PluginBundle-MARCEL',
                       'CONFIGURE_REQUIRES' => {
                                                 'ExtUtils::MakeMaker' => '6.11'
                                               },
                       'AUTHOR' => 'Marcel Gruenauer <marcel@cpan.org>',
                       'BUILD_REQUIRES' => {},
                       'ABSTRACT' => 'build POD documentation like MARCEL',
                       'EXE_FILES' => [],
                       'VERSION' => '1.100690',
                       'PREREQ_PM' => {
                                        'Test::More' => '0',
                                        'namespace::autoclean' => '0',
                                        'English' => '0',
                                        'File::Find' => '0',
                                        'File::Temp' => '0',
                                        'Pod::Weaver::Config::Assembler' => '0'
                                      },
                       'LICENSE' => 'perl'
                     );


delete $WriteMakefileArgs{LICENSE}
  unless eval { ExtUtils::MakeMaker->VERSION(6.31) };

WriteMakefile(%WriteMakefileArgs);



