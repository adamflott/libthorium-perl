package Thorium::BuildConf::Knob::URL::HTTP;

# ABSTRACT: HTTP URL

use Thorium::Protection;

use Moose;

# local
use Thorium::Types qw(URLHTTP);

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
    'isa' => URLHTTP,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => URLHTTP,
    'is'      => 'ro',
    'default' => sub { 'http://127.0.0.1' }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::InputBox);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
