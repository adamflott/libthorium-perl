package Thorium::BuildConf::Knob::UnixBinary;

# ABSTRACT: Unix binary

use Thorium::Protection;

use Moose;

# core
use File::Spec;

# local
use Thorium::Types qw(UnixExecutableFile);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => '...'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => '...'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => '...'
);

has 'value' => (
    'isa' => UnixExecutableFile,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => '/tmp/a.out'
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::FileSelect);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
