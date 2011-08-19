package Pizza::Conf;

use Moose;

extends 'Thorium::Conf';

# CPAN
use Dir::Self;
use Path::Class::File;

has '+component_name' => ('default' => 'pizza-recipe-maker');

has '+component' => (
    'default' => sub {
        my @files = (Path::Class::File->new(__DIR__, '..', '..', 'conf', 'presets', 'defaults.yaml')->stringify,);

        my $preset_config = Path::Class::File->new(__DIR__, '..', '..', 'conf', 'local.yaml')->stringify;

        if (-e -r -s $preset_config) {
            push(@files, $preset_config);
        }

        return \@files;
    }
);

__PACKAGE__->meta->make_immutable;
no Moose;
