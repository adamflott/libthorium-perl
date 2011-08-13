package Thorium::Roles::Conf;

# ABSTRACT: Adds configuration to your class

use Thorium::Protection;

use Moose::Role;

# local
use Thorium::Conf;

# Attributes
has 'conf' => (
    'is'         => 'ro',
    'isa'        => 'Thorium::Conf',
    'lazy_build' => 1
);

# Builders
sub _build_conf {
    return Thorium::Conf->new;
}

no Moose::Role;

1;

__END__

=head1 DESCRIPTION

Adds one attribute, 'conf', to the consuming class which will instantiate a
Thorium::Conf object.

=head1 SYNOPSIS

    with 'Thorium::Roles::Conf';

    ...

    print $self->conf->data('some.stuff');
