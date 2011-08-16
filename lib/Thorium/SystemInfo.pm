package Thorium::SystemInfo;

# ABSTRACT: Query system information

use Thorium::Protection;

use Moose;

# core
use Sys::Hostname qw();

# CPAN
use Sys::HostIP;
use Sys::Info;

has 'eth0_ipv4' => (
    'is'      => 'rw',
    'isa'     => 'Maybe[Str]',
    'default' => sub {
        my $ifs = Sys::HostIP->new->interfaces;

        if ($ifs->{'eth0'}) {
            return $ifs->{'eth0'};
        }

        return;
    }
);

has 'ethernet_interfaces' => (
    'is'      => 'rw',
    'isa'     => 'HashRef',
    'default' => sub {
        return Sys::HostIP->new->interfaces;
    }
);

has 'hostname' => (
    'is'      => 'ro',
    'isa'     => 'Str',
    'default' => sub { Sys::Hostname::hostname }
);

has 'os' => (
    'is'      => 'ro',
    'isa'     => 'Sys::Info::OS',
    'default' => sub { Sys::Info->new->os }
);

no Moose;
__PACKAGE__->meta->make_immutable;

1;

=head1 DESCRIPTION

A class for querying information about the system. Primarily useful in
L<Thorium::BuildConf> fixups.

=head1 SYNOPSIS

    use Thorium::SystemInfo;

    my $sysinfo = Thorium::SystemInfo->new;

    print 'eth0 IP is ', $sysinfo->eth0_ipv4;

=head1 ATTRIBUTES

=head2 Optional Attributes

=over

=item * B<eth0_ipv4> (C<rw>, C<Str>)

eth0 IPv4 address.

=item * B<ethernet_interfaces> (C<rw>, C<HashRef>)

HashRef where the key is the ethernet device name and the value is the IPv4 address.

=item * B<hostname> (C<ro>, C<Str>)

Hostname.

=item * B<os> (C<ro>, L<Sys::Info::OS>)

Returns a L<Sys::Info::OS> object.

=back