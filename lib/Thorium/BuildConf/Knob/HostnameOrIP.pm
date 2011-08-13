package Thorium::BuildConf::Knob::HostnameOrIP;

# ABSTRACT: Network IP hostname or IP address

use Thorium::Protection;

use Moose;

# local
use Thorium::Types qw(HostnameOrIP);
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
    'isa' => HostnameOrIP,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => HostnameOrIP,
    'is'      => 'ro',
    'default' => sub { Thorium::SystemInfo->new->hostname }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::InputBox);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
