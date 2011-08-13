#!/usr/bin/env perl

use strict;
use warnings;

use Test::More tests => 10;

# core
use Cwd;
use Data::Dumper;
use FindBin qw();
use Scalar::Util qw();

# CPAN
use Path::Class::File;
use Try::Tiny;
use YAML::XS qw(Dump);

# local
use lib "$FindBin::Bin";

use Thorium::Conf;
use ThoriumTestComponent;

diag('WARNING: if this test (conf.t) fails, check /etc/thorium/conf/thorium.yaml as that may alter data. It would probably be a good idea to add an attribute to Thorium::Conf to disable loading that file for testing purposes.');

# data ...
my $fp  = Path::Class::File->new($FindBin::Bin, 'etc', 'from.yaml');
my $fp2 = Path::Class::File->new($FindBin::Bin, 'etc', 'from2.yaml');
my $tp  = Path::Class::File->new('/tmp/whatever.yaml');
my $fh;

my $correct_data_structure = {
    a => [ 1,
           { 2 => 3 }
       ],
    b => {
        b1 => 4,
        b2 => 5
    },
};

open($fh, '>', $fp->stringify) or die $!;
print {$fh} YAML::XS::Dump({a => [], b => [ ] });
close($fh);

open($fh, '>', $fp2->stringify) or die $!;
print {$fh} YAML::XS::Dump($correct_data_structure);
close($fh);

# tests ...

# use case #1 direct

my $conf = Thorium::Conf->new(from => [ $fp->stringify, $fp2->stringify ]);

# load
is_deeply($conf->data, $correct_data_structure, 'data() returns correct data structure from file overloading');

# set() and # data()
is($conf->set('b.b1', 'something else'), 1, 'set new data');
is($conf->data('b.b1'), 'something else', 'data() returns changed data');

# reload()
my $correct_data_structure2 = {
    a => [ 6,
           { 7 => 8 }
       ],
    b => {
        b1 => 9,
    },
    c => 10
};

open($fh, '>', $fp2->stringify) or die $!;
print {$fh} YAML::XS::Dump($correct_data_structure2);
close($fh);

$conf->reload;
is_deeply($conf->data, $correct_data_structure2, 'changing data and reload() are the same');

# save()
is($conf->save($tp->stringify), 1, 'wrote 1 file');
my $data = YAML::XS::LoadFile($tp->stringify);
is_deeply($data, $correct_data_structure2, 're-reading save()ed data is correct');

$conf = undef;

# extending ...
my $conf2 = ThoriumTestComponent->new;

is_deeply($conf2->data('global'), { some => 'data' }, 'global data');

is($conf2->data('extended'), 'yep', 'extended data exists');
is($conf2->data('preset'), 'data', 'preset data from local.yaml exists');

# misc ...
my $conf3 = Thorium::Conf->new;

is_deeply($conf3->data, { }, 'empty data');

# $conf relies on these files being preset during the whole test, therefore remove them after all tests
END {
    foreach my $f ($fp->stringify, $fp2->stringify, $tp->stringify) {
        unlink $f;
    }
}
