package Thorium::BuildConf::Knob::ApacheLogLevel;

# ABSTRACT: Apache's LogLevel directive

use Thorium::Protection;

use Moose;

# local
use Thorium::Types qw(ApacheLogLevel);

has 'conf_key_name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'apache.logs.level'
);

has 'name' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache log level'
);

has 'question' => (
    'isa'     => 'Str',
    'is'      => 'ro',
    'default' => 'Apache log level?'
);

has 'value' => (
    'isa' => ApacheLogLevel,
    'is'  => 'rw',
);

has 'selected' => (
    'isa'     => 'Int',
    'is'      => 'rw',
    'default' => 0
);

has 'data' => (
    'isa'     => 'ArrayRef[HashRef]',
    'is'      => 'ro',
    'default' => sub {
        my @levels;
        foreach my $level (@Thorium::Types::apache_log_levels) {
            push(@levels, {'name' => $level, 'text' => $level});
        }
        return \@levels;
    }
);

with qw(Thorium::BuildConf::Roles::Knob Thorium::BuildConf::Roles::UI::RadioList);

__PACKAGE__->meta->make_immutable;
no Moose;

1;
