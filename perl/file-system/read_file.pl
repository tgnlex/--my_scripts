#!/user/bin/perl
use strict;
use warnings; 

use Path::Tiny;

use autodie; 

my $dir = path("/tmp"); 

my $file = $dir->child("file.txt")

# Read in entire contents of file
my $content = $file->slurp_utf8();

# openr_utf8() 
# returns an IO::File object to read form
my $file_handle = $file->openr_utf8();

# Read in line at a time
while( my $line = $file_handle->getline() ) {
    print $line;
}