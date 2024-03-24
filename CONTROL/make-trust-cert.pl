#!/usr/bin/env perl

# This script downloads the Mozilla certdata.txt file and extracts the certificates
# It will output the certificates in PEM format to the stdout pipe

use strict;
use warnings;

our $CERTDATA_URL = 'https://hg.mozilla.org/releases/mozilla-release/raw-file/default/security/nss/lib/ckfw/builtins/certdata.txt';

my ($read_pipe, $write_pipe);
my $incert = 0;
open $read_pipe, "-|" or exec "curl", "-sL", $CERTDATA_URL or die $!;
while ( my $line = <$read_pipe> ) {
  if ( $line =~ /^CKA_VALUE MULTILINE_OCTAL/ ) {
    $incert = 1;
    open $write_pipe, "|-" or exec "openssl", "x509", "-text", "-inform", "DER", "-fingerprint" || die "could not pipe to openssl x509";
  } elsif ( $line =~ /^END/ && $incert ) {
    close $write_pipe;
    $incert = 0;
    print "\n\n";
  } elsif ($incert) {
    my @bs = split( /\\/, $line );
    foreach my $b (@bs) {
      chomp $b;
      printf( $write_pipe "%c", oct($b) ) if $b ne '';
    }
  }
}
close $read_pipe;
