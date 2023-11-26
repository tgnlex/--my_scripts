#!/usr/bin/perl
# backwards.pl
use warnings;
use strict;
print "Enter a string or sequence: \n";


 while (<STDIN>) {
	chomp;
	die "!enod llA\n" unless $_;
	my $backwards = reverse $_;
	print "$backwards\n"
 };

