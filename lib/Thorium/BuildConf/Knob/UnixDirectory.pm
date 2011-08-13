package Thorium::BuildConf::Knob::UnixDirectory;

# ABSTRACT: Unix directory

use Thorium::Protection;

use Moose;

# local
use Thorium::Types qw(UnixDirectory);

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
    'isa' => UnixDirectory,
    'is'  => 'rw'
);

has 'data' => (
    'isa'     => UnixDirectory,
    'is'      => 'ro',
    'default' => '/tmp'
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::DirectorySelect);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
