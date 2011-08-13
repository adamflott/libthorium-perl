package Thorium::BuildConf::Knob::ApacheServerRoot;

# ABSTRACT: Apache's ServerRoot directive

use Thorium::Protection;

use Moose;

# core
use FindBin qw();

# local
use Thorium::Types qw(UnixDirectory);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'apache.server.root'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache server root'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'What is the Apache server root directory?'
);

has 'value' => (
    'isa' => UnixDirectory,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => UnixDirectory,
    'is'      => 'ro',
    'default' => sub { File::Spec->catdir($FindBin::Bin) }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::DirectorySelect);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
