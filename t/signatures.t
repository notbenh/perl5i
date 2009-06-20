#!/usr/bin/perl -w

# XXX There's a bug in signatures where it shoves itself into every eval()
# so if it gets loaded before Test::More, kablooey!
use Test::More;
use perl5i;

{
    sub add ($arg) {
        return $arg + 1;
    }

    is add(42), 43;
    is add(1), 2;
}


{
    sub named( :$foo ) {
        return $foo . " and stuff";
    }

    is named( foo => "Things" ), "Things and stuff";
}


{
    # XXX signatures.pm has parsing errors, it will not handle multi line prototypes
    sub iso_date( :$year!, :$month = 1, :$day = 1, :$hour = 0, :$min = 0, :$sec = 0 )
    {
        return sprintf "%04d-%02d-%02dT%02d:%02d:%02d",
          $year, $month, $day, $hour, $min, $sec;
    }

    is iso_date( year => 2008 ), "2008-01-01T00:00:00";
}


{
    is eval "42", 42;
}

done_testing();
