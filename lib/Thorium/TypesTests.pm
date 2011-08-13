package Thorium::TypesTests;

# ABSTRACT: additional tests for Thorium::Types

use Thorium::Protection;

# core
use Net::Ping;

# CPAN
use Devel::Symdump;
use LWP::UserAgent qw();
use HTTP::Request qw();
use Sub::Exporter qw();
use URI;

# be lazy and grab all the function names starting with test_ and then export them
my @funcs_names = grep { /^test_/ } map { (split('::', $_))[-1] } (Devel::Symdump->new(__PACKAGE__)->functions);

Sub::Exporter::setup_exporter(
    {
        'exports' => \@funcs_names,
        'groups'  => {'default' => \@funcs_names}
    }
);

sub proceed {
    if (exists($ENV{'THORIUM_DISABLE_TYPES_TEST'}) && $ENV{'THORIUM_DISABLE_TYPES_TEST'}) {
        return 0;
    }
    return 1;
}

sub test_HostnameOrIP {
    my ($self, $new_host) = @_;

    my $p = Net::Ping->new('tcp', 2);

    unless ($p->ping($new_host)) {
        warn("$new_host is not accepting TCP packets on the echo service port, therefore the host may be down. Verify with the ping command");
    }

    return 1;
}

1;

__END__

=head1 SYNOPSIS

    use Thorium::TypesTests qw(HostnameOrIP);

    has 'response' => (
        'isa'     => HostnameOrIP,
        'is'      => 'rw',
        'default' => sub { '192.168.0.10' },
        'trigger' => sub { Thorium::TypesTests::test_HostnameOrIP(@_) }
    );

=head1 DESCRIPTION

Use this if you'd like to add additional tests as either Moose attribute
triggers or as a standalone library for additional more complicated tests. For
instance, C<HostnameOrIP> test above will ping the host.
