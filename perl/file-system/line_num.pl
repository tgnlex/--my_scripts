#!/usr/bin/perl
use warnings;
use strict;

my $linenum;
my $current = "";

while (<>) {
	if ($current ne $ARGV) {
		$current = $ARGV; 
		print "\n\t\tFile: $ARGV\n\n";
		$linenum=1; 
	}
	
	print $linenum++;
	print ":$_";
}
