package Thorium::Roles::Logging;

# ABSTRACT: Adds standard logging to your class

use Thorium::Protection;

use MooseX::Role::Strict;

# core
use Scalar::Util qw(blessed);

# local
use Thorium::Log;

# Attributes
has 'log' => (
    'is'         => 'ro',
    'isa'        => 'Thorium::Log',
    'lazy_build' => 1,
);

# Builders
sub _build_log {
    my $self = shift;

    # If we'd like to add configuring logging through Thorium::Roles::Conf,
    # then this is where we'd do it
    my $log = Thorium::Log->new(
        'set_category' => blessed $self,
        'caller_depth' => 3
    );

    return $log;
}

no Moose::Role;

1;

__END__

=head1 DESCRIPTION

Adds one attribute, 'log' to the consuming class, which will instantiate to a
Thorium::Log object at first use. Category is automatically set to the class
name instantiated under.

=head1 SYNOPSIS

    with 'Thorium::Roles::Logging';

    ...

    $self->log->warn('look out! impending destruction awaits ahead!');
