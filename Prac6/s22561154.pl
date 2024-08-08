#!/usr/bin/perl5

if ($#ARGV + 1 != 2) {
    print "Usage: perl s<student_number>.pl <input_file> <word_to_search>\n";
    exit(1);
}

my $input_file = $ARGV[0];
my $word_to_search = $ARGV[1];

open(my $fh, '<', $input_file) or die "Could not open file '$input_file' $!";
my $input_contents = do { local $/; <$fh> };
close($fh);

my $input_cleaned = lc($input_contents);
$input_cleaned =~ s/[^a-zA-Z]//g;

print "The converted string would be:\n$input_cleaned\n";

my $word_count = (() = reverse($input_cleaned) =~ /\Q$word_to_search\E/g);

print "Matches: $word_count\n";
