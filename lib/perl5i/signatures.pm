package perl5i::signatures;

use strict;
use warnings;

use parent 'signatures';
require Method::Signatures;

sub proto_unwrap {
    my $class = shift;
    return Method::Signatures->parse_sub( proto => $_[0] );
}

1;
