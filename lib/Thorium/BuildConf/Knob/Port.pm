package Thorium::BuildConf::Knob::Port;

# ABSTRACT: Network IP port

use Thorium::Protection;

use Moose;

# core
use Cwd;

# local
use Thorium::Types qw(Port);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'port'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Listening Port'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'What port will this server listen on?'
);

has 'value' => (
    'isa' => Port,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => Port,
    'is'      => 'ro',
    'default' => sub { 8080 }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::InputBox);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
