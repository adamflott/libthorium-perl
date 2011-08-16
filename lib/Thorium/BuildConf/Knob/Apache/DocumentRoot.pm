package Thorium::BuildConf::Knob::Apache::DocumentRoot;

# ABSTRACT: Apache's DocumentRoot directive

use Thorium::Protection;

use Moose;

# core
use FindBin qw();

# local
use Thorium::Types qw(UnixDirectory);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'apache.document_root'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache document root'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'What is the Apache document root directory?'
);

has 'value' => (
    'isa' => UnixDirectory,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => UnixDirectory,
    'is'      => 'ro',
    'default' => sub { File::Spec->catdir($FindBin::Bin, '/htdocs') }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::DirectorySelect);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
