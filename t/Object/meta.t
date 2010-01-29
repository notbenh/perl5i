#!/usr/bin/perl 

use strict;
use warnings;

use Test::Most qw{no_plan};

#-----------------------------------------------------------------
#  
#-----------------------------------------------------------------
BEGIN {

   use_ok('Object::Internal::0');
   can_ok('Object::Internal::0', qw{
      isa 
      can
   });

}

#-----------------------------------------------------------------
#  
#-----------------------------------------------------------------
ok( my $obj  = Object::Internal::0->new() );
isa_ok(  $obj, 
   'Object::Internal::0', 
   q{[Object::Internal::0] new()},
);




