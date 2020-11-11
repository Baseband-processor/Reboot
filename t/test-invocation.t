#!/Usr/bin/perl

# Made by Edoardo Mantovani, 2020
# Basic library invocation
use strict;
use warnings;

use Test;

sub BEGIN{ plan tests=> 1};
use Reboot qw( :boot_const :boot_funct );

ok(1);
