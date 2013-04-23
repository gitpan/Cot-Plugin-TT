# NAME

Cot::Plugin::TT - It is a Template::Toolkit View module for Cot framework.

# SYNOPSIS

    use Cot;
    use Cot::Plugin qw/TT/;

    get '/' => sub {
        my $self = shift;
        $self->res->status(200);
        $self->res->headers({'Content-Type' => 'text/html', charset => 'utf8'});
        my $out = $self->tt->output('index.tmpl',{sample:'hello world!'});
        $self->res->body($out);
    };

# FUNCTIONS

## output

Template file must be installed in __$ENV{COT\_ROOT}/tmpl__ dir.

    my $out = $self->tt->output('index.tmpl',{sample:'hello world!'});

# DESCRIPTION

Cot::Plugin::TT - It is a Template::Toolkit View module for Cot framework.

# LICENSE

Copyright (C) Yusuke Shibata

This library is free software; you can redistribute it and/or modify
it under the same terms as Perl itself.

# AUTHOR

Yusuke Shibata <shibata@yusukeshibata.jp>
