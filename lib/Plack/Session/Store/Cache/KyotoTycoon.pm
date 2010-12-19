package Plack::Session::Store::Cache::KyotoTycoon;
use strict;
use warnings;
use Cache::KyotoTycoon;
use JSON::XS;

our $VERSION = '0.01';

sub new {
    my $class = shift;
    my $kt    = Cache::KyotoTycoon->new(%_);
    bless { kt => $kt }, $class;
}

sub fetch {
    my ( $self, $session_id ) = @_;
    decode_json( $self->{kt}->get($session_id) || '{}' );
}

sub store {
    my ( $self, $session_id, $session ) = @_;
    $self->{kt}->set( $session_id, encode_json($session) );
}

sub remove {
    my ( $self, $session_id ) = @_;
    $self->{kt}->remove($session_id);
}

1;
__END__

=head1 NAME

Plack::Session::Store::Cache::KyotoTycoon - Session store for Plack::Session::Store which uses Cache::KyotoTycoon

=head1 SYNOPSIS

  use Plack::Builder;
  use Plack::Session::Store::Cache::KyotoTycoon;
  use MyApp::App;
  my $app = MyApp::Web->app;
  builder {
      enable 'Session',
          store => Plack::Session::Store::Cache::KyotoTycoon->new(
              host => '127.0.0.1',
              port => 1978,
              db   => 0,
          );
      $app;
  };


=head1 DESCRIPTION

Plack::Session::Store::Cache::KyotoTycoon is Session store for Plack::Session::Store which uses Cache::KyotoTycoon

=head1 AUTHOR

Nishibayashi Takuji E<lt>takuji {at} senchan.jpE<gt>

=head1 SEE ALSO

Plack::Middleware::Session Cache::KyotoTycoon

=head1 LICENSE

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=cut
