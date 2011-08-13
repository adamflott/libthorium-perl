package Thorium::BuildConf::Knob::Hostname;

# ABSTRACT: Network hostname

use Thorium::Protection;

use Moose;

# local
use Thorium::Types qw(Hostname);
use Thorium::SystemInfo;

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
    'isa' => Hostname,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => Hostname,
    'is'      => 'ro',
    'default' => sub { Thorium::SystemInfo->new->hostname }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::InputBox);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
