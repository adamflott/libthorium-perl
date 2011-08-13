package Thorium::Log::Apache;

# ABSTRACT: Apache specific log class

use Thorium::Protection;

use Moose;

extends 'Thorium::Log';

has '+prefix' => (
    'default' => sub {
        if (exists($ENV{'MOD_PERL'})) {
            return sprintf('[id:%s] ', $ENV{'UNIQUE_ID'} || '?');
        }
    },
    'lazy' => 1
);

1;

no Moose;

1;

__END__