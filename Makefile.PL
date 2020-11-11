  
#!/usr/bin/perl

# Made by Edoardo Mantovani, 2020
# Main installer for Reboot library

use strict;
no strict 'refs';
no strict 'subs';
use warnings;
use ExtUtils::MakeMaker;


WriteMakefile(
   NAME => 'Reboot',
   LICENSE => 'BSD2',
   AUTHOR => 'Edoardo Mantovani aka Baseband',
  # CCFLAGS        => '-Wall -std=c99',
  # OPTIMIZE       => '-oS  ',
   'OPTIMIZE' => '-O1', 
   DEFINE => '',
   VERSION_FROM => 'lib/Reboot.pm',
   LIBS => ['-L/lib -L/usr/lib -L/usr/local/lib '],
   INC => '-I/include -I/usr/include -I/usr/local/include',
   PREREQ_PM => {
     
  },
);

# NOTE: for now the OPTIMIZE and the CCFLAGS are flawed, will be updated in future

## END ##
