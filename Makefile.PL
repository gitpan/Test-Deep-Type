
use strict;
use warnings;

use 5.006;

use ExtUtils::MakeMaker 6.30;



my %WriteMakefileArgs = (
  "ABSTRACT" => "A Test::Deep plugin for validating type constraints",
  "AUTHOR" => "Karen Etheridge <ether\@cpan.org>",
  "BUILD_REQUIRES" => {
    "File::Find" => 0,
    "File::Temp" => 0,
    "Test::CheckDeps" => "0.002",
    "Test::Deep" => 0,
    "Test::Fatal" => 0,
    "Test::More" => "0.88",
    "Test::NoWarnings" => "1.04",
    "Test::Requires" => 0,
    "Test::Tester" => "0.108",
    "overload" => 0
  },
  "CONFIGURE_REQUIRES" => {
    "ExtUtils::MakeMaker" => "6.30"
  },
  "DISTNAME" => "Test-Deep-Type",
  "EXE_FILES" => [],
  "LICENSE" => "perl",
  "NAME" => "Test::Deep::Type",
  "PREREQ_PM" => {
    "Exporter" => 0,
    "Safe::Isa" => 0,
    "Scalar::Util" => 0,
    "Test::Deep::Cmp" => 0,
    "Try::Tiny" => 0,
    "parent" => 0,
    "strict" => 0,
    "warnings" => 0
  },
  "VERSION" => "0.002",
  "test" => {
    "TESTS" => "t/*.t"
  }
);


unless ( eval { ExtUtils::MakeMaker->VERSION(6.56) } ) {
  my $br = delete $WriteMakefileArgs{BUILD_REQUIRES};
  my $pp = $WriteMakefileArgs{PREREQ_PM};
  for my $mod ( keys %$br ) {
    if ( exists $pp->{$mod} ) {
      $pp->{$mod} = $br->{$mod} if $br->{$mod} > $pp->{$mod};
    }
    else {
      $pp->{$mod} = $br->{$mod};
    }
  }
}

delete $WriteMakefileArgs{CONFIGURE_REQUIRES}
  unless eval { ExtUtils::MakeMaker->VERSION(6.52) };

WriteMakefile(%WriteMakefileArgs);



