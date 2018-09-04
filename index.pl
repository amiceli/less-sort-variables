#!/usr/bin/perl

my $fileToParse     = @ARGV[0];
my @sortedVariables = ();

my %variables = extractVariableFromFile($fileToParse);

writeFileLineByLine('sort.less', %variables);

sub extractVariableFromFile {
    my ($file) = @_;

    my %variablesLines = qw();

    open(my $fh, '<:encoding(UTF-8)', $file) or die "Could not open file '$file' $!";

    while( my $line = <$fh>)  {
        my @split = split / : /, $line;
        my $name  = trim(@split[0]);
        my $value = trim(@split[1]);

        if ($variablesLines{$value}) {
            push $variablesLines{$value}, $name;
        } else {
            $variablesLines{$value} = [$name];
        }
    }

    return %variablesLines;
}

sub writeFileLineByLine {
    my ($filename, %variables) = @_;

    open(my $fh, '>', $filename) or die "Could not open file '$filename' $!";

    foreach my $key (keys %variables) {

        foreach $nextItem (@{$variables{$key}}) {
            print $fh "$nextItem : $key\n";
        }

        print $fh "\n";

    }

    close $fh;
}

sub trim {
    my (my $s) = @_;

    $s =~ s/^\s+|\s+$//g;

    return $s;
}
