package Thorium::BuildConf::Knob::Apache::ErrorLog;

# ABSTRACT: Apache's ErrorLog directive

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
    'default' => 'apache.logs.error'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache error log path'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache error log filename (relative or absolute)?'
);

has 'value' => (
    'isa' => UnixFilename,
    'is'  => 'rw',
);

has 'data' => (
    'isa'     => UnixFilename,
    'is'      => 'ro',
    'default' => sub { File::Spec->catfile($FindBin::Bin, 'logs', 'error_log') }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::FileSelect);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
