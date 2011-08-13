package Thorium::BuildConf::Knob::ApacheAccessLog;

# ABSTRACT: Apache's AccessLog directive

use Thorium::Protection;

use Moose;

# core
use FindBin qw();
use File::Spec;

# local
use Thorium::Types qw(UnixFilename);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'apache.logs.access'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache access log path'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Where is the Apache access log filename (relative or absolute)?'
);

has 'value' => (
    'isa' => UnixFilename,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => UnixFilename,
    'is'      => 'ro',
    'default' => sub { File::Spec->catfile($FindBin::Bin, 'logs', 'access_log') }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::FileSelect);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
