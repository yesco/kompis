my $name, $typ, $def, $no;

open(IN, "Doc/protocol-a-current.txt");

sub end {
    return unless $name;

    if ($def =~ s/^[\n\s]*([\w-]+)\s+\(/\(/) {
	$typ = $1;
    } else {
	$typ = "LIST";
    }
    
    # format def
    $def =~ s/\s+/ /g;
    $def =~ s/\(/\n/g;
    $def =~ s/\)/\n/g;
    $def =~ s/;/\n/g;
    $def =~ s/->/\n->/g;

    $def =~ s/^(\s*\n+\s*)+//;
    #$def =~ s/\n/\n  /g;
    $def =~ s/\n+\s*/\n/g;

    print ":$typ\n$def\n\n";

    $name = undef;
    $no = undef;
    $def = undef;
    $typ = undef;
}

while(<IN>) {
    # start data type def
    if (s/^([\w-]+)\s+::=\s*//) {
	my ($n,$nn,$d) = ($1,$2,$_);
	end();
	$name = $n;
	$no = undef;
	$def = $d;
	print "---TYPE $name\n";
	next;
    }
    # start request def
    if (s/^([\w-]+)\s+\[(\d+)\]//) {
	my ($n,$nn,$d) = ($1,$2,$_);
	end();
	$name = $n;
	$no = $nn;
	$def = $d;
	print "---REQ $no $name\n";
	next;
    }
    # end
    if (/^%/) {
	end();
    }

    if ($name) {
	$def .= $_;
    }
}
