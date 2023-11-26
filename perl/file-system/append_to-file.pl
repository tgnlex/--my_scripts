#!/user/bin/perl
use strict;
use warnings;

use Path::Tiny; 
use autodie; #abort if problem w/ read/write

my $dir = path("/tmp"); #/tmp
my $file = $dir->child("file.txt"); #/tmp/file

# Get a file handle we can write to 
#with a UTF-8 encoding layer
my $file_handle = $file->opena_utf8();

my @list = ('a', 'list', 'of', 'lines')

foreach my $line ( @list ) {
    # Add the line to the file
    $file_handle->print($line . "\n")
}