#!/usr/bin/perl

use Test::More;
use Test::Exception;

{
    package Foo;
    use perl5i;

    method new($class:@_) {
        bless {@_}, $class;
    }

    method iso_date(
        :$year!,    :$month = 1, :$day = 1,
        :$hour = 0, :$min   = 0, :$sec = 0
    )
    {
        return "$year-$month-$day $hour:$min:$sec";
    }
}

my $obj = new_ok "Foo";

is( $obj->iso_date(year => 2008), "2008-1-1 0:0:0" );
throws_ok {
    $obj->iso_date();
} qr/^Foo::iso_date\(\) missing required argument \$year at $0 line/;

done_testing();
