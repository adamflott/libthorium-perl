package Thorium::BuildConf::Knob::UnixFilename;

# ABSTRACT: Unix filename

use Thorium::Protection;

use Moose;

# local
use Thorium::Types qw(UnixFilename);

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
    'isa' => UnixFilename,
    'is'  => 'rw'
);

has 'data' => (
    'isa'     => UnixFilename,
    'is'      => 'ro',
    'default' => '/tmp'
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::FileSelect);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
