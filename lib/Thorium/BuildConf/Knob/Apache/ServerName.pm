package Thorium::BuildConf::Knob::Apache::ServerName;

# ABSTRACT: Apache's ServerName directive

use Thorium::Protection;

use Moose;

# core
use Sys::Hostname;

# CPAN
use Sys::HostAddr;

# local
use Thorium::Types qw(Hostname);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'apache.server.name'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache server name'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'What is the Apache server name (normally the fully qualified domain name?'
);

has 'value' => (
    'isa' => Hostname,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => Hostname,
    'is'      => 'ro',
    'default' => sub { Sys::Hostname::hostname }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::InputBox);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
