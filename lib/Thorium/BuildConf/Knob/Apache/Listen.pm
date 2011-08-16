package Thorium::BuildConf::Knob::Apache::Listen;

# ABSTRACT: Apache's Listen directive

use Thorium::Protection;

use Moose;

# CPAN
use Sys::HostAddr;

# local
use Thorium::Types qw(ApacheListen);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'apache.listen'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache listen'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'What is the IP and port to listen on (use the Apache2 Listen syntax)?'
);

has 'value' => (
    'isa' => ApacheListen,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => sub { Sys::HostAddr->new->main_ip . ':8080' }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::InputBox);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
