package ThoriumTestComponent;

use Moose;

extends 'Thorium::Conf';

use Cwd;
use FindBin qw();

has '+_system_directory_root' => (
    'default' => sub { $FindBin::Bin . '/etc' }
);

has '+component_name' => (
    'default' => 'thoriumtestcomponent'
);

has '+component' => (
    'default' => sub {
        [ $FindBin::Bin . '/etc/component.yaml', $FindBin::Bin . '/etc/local.yaml' ]
    }
);

no Moose;
__PACKAGE__->meta->make_immutable;

1;

__END__

=head1 DESCRIPTION

A sub class demonstrating and extending Thorium::Conf and used for testing
