package Cot::Plugin::TT;
use strict;
use warnings;
use 5.008005;
our $VERSION = "0.01";
use Template;
use File::Spec;
use parent qw(Cot::Plugin);
use Carp;

sub init {
    my ( $self, $c ) = @_;
    $c->tt($self);
}

sub _root {
    File::Spec->catdir( $ENV{COT_ROOT} || '.', "tmpl" );
}

sub output {
    my $self = shift;
    my $ttfile = File::Spec->catfile( __PACKAGE__->_root, shift );
    croak "template file not found.[$ttfile]" unless ( -f $ttfile );
    my $param  = shift;
    my $output = '';
    my $tt =
      Template->new( { INCLUDE_PATH => __PACKAGE__->_root, ABSOLUTE => 1, } );
    $tt->process( $ttfile, $param, \$output )
      or croak $tt->error;
    return $output;
}

1;
__END__

=encoding utf-8

=head1 NAME

Cot::Plugin::TT - It is a Template::Toolkit View module for Cot framework.

=head1 SYNOPSIS

    use Cot;
    use Cot::Plugin qw/TT/;

    get '/' => sub {
        my $self = shift;
        $self->res->status(200);
        $self->res->headers({'Content-Type' => 'text/html', charset => 'utf8'});
        my $out = $self->tt->output('index.tmpl',{sample:'hello world!'});
        $self->res->body($out);
    };

=head1 FUNCTIONS

=head2 output

Template file must be installed in B<$ENV{COT_ROOT}/tmpl> dir.

    my $out = $self->tt->output('index.tmpl',{sample:'hello world!'});

=head1 DESCRIPTION

Cot::Plugin::TT - It is a Template::Toolkit View module for Cot framework.

=head1 LICENSE

Copyright (C) Yusuke Shibata

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

=head1 AUTHOR

Yusuke Shibata E<lt>shibata@yusukeshibata.jpE<gt>

