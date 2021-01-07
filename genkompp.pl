open(IN, "kom.ddl");

my $name, $no, $typ, $def, $ret;

print "
int pIndent = 0;

int pNL() {
    printf(\"\\n\");
    for(int i = 0; i < pIndent; i++) {
      printf(\"  \");
    }
    return 1;
}

int pOUT(char* s) {
    printf(\"%s\", s);
    return 1;
}

int pBEGIN(char* name, char* typ) {
    pOUT(name);
    pOUT(\" : \");
    pOUT(typ);
    pIndent++;
    pNL();
    return 1;
}

int pEND(char* name) {
    //pOUT(name);
    pIndent--;
    return 1;
}

int pERROR(char* name) {
    printf(\"\\n%%Error parsing field %s\", name);
    pIdent--;
    pNL();
    return 0;
}

int pTOOBIG(char* name, long v) {
    pOUT(\"Value too big for \");
    pOUT(name);
    pOUT(\" == \");
    printf(\"%l\", v);
    return pERROR(name);
}

// parse basic data types

long parseLong(char* name, char* typ) {
    long v = 4711;    
    // TODO: what to do at error?
    pBEGIN(name, typ);
    printf(\"%ll\", v);
    pEND(name);
    return v;
}

int pBIT(char* name, long bitv) {
    if (bitv) {
      pBEGIN(name, \"BIT\");
      pOUT(\" = 1\");
      pEND(name);
    }
    return 1;
}

int pINT8(char* name) {
    long v = parseLong(name, \"INT8\");
    if (v < 0 || v > 255)
       return pTOOBIG(name, v);
    return 1;
}

int pINT16(char* name) {
    long v = parseLong(name, \"INT16\");
    if (v < 0 || v > 65535)
       return pTOOBIG(name, v);
    return 1;
}

int pINT32(char* name) {
    long v = parseLong(name, \"INT32\");
    if (v < 0 || v >= 65536L*65536)
       return pTOOBIG(name, v);
    return 1;
}

int pFLOAT(char* name) {
    pERROR(name);
    return 0;
}

int pHOLLERITH(char* name) {
    pERROR(name);
}

typedef int(char*) pFuncType;

int pARRAY(pFuncTYpe fun, char* name) {
    long n = parseLong(name, \"ArrayLength\");
    for(long i=0; i<n; i++) {
       if (!fun(name))
         return pERROR(\"ARRAY\");
    }
    return 1;
}

int pRESPONSE(char* name) {
    if (pCHAR('%')) {
       // loop till fail or newline
       while(!pCHAR('\n') && pSTEP());

       return 0;
    } else if (pCHAR('=')) {
      long no = parseLong(name, 'ReqNo');
      return 1;
    } else {
      return pERROR(name);
    }
}

////////////////////
// Below: generated parsers for various types
";

my $name, $req;

while(<IN>) {
    next if /^\s*$/;
    chop();
    if (/^---TYPE (\S+)/) {
	$name = $1;
    }
    if (/^---REQ (\d+) (\S+)/) {
	$req = 0 + $1;
	$name = "Q_$2";
    }
    if ($name) {
	$name =~ s/\-/_/g;
	my $typ = <IN>;
	chop($typ);
	my $def = "";
	print "int p$name(char* name) {\n";
	print "  // $typ\n";
	if ($typ eq ":BITSTRING") {
	    print "  long v = parseLong(\"name\", NULL);\n";
	}
	print "  return pBEGIN(name, \"$name\") &&\n";
	if ($typ eq ":LIST") {
	    while (<IN>) {
		chop();
		#print ">$_<";
		last if /^\s*$/;
		if (/->/) {
		    print "    pRESPONSE() &&\n";
		} elsif (/^(\S+)\s+:\s+(.*)\s*$/) {
		    my $field = $1;
		    my $t = $2;
		    $field =~ s/\-/_/g;
    		    $t =~ s/\-/_/g;
		    $t =~ s/ //g;
		
		    # sameXXXcode
		    if ($t =~ s/^ARRAY//) {
			print "    pARRAY(&p$t, \"$field\") &&\n";
		    } else {
			print "    p$t(\"$field\") &&\n";
		    }
			
		} elsif (/^(ARRAY \S+|\S+)\s*$/) {
		    # there should only be one? type aliases?
		    my $field = $1;
		    $field =~ s/\-/_/g;
		    $field =~ s/ //g;

		    # sameXXXcode
		    if ($t =~ s/^ARRAY//) {
			print "    pARRAY(&p$t, \"$field\") &&\n";
		    } else {
			print "    p$t(\"$field\") &&\n";
		    }
			
		} else {
		    print "\n%% Error in $name: $_\n";
		}
	    }
	} elsif ($typ eq ":BITSTRING") {
	    my $bitv = 1;
	    while (<IN>) {
		chop();
		last if /^\s*$/;
		print "    pBIT(\"$_\", $bitv && v) &&\n";
		$bitv *= 2;
	    }
	    printf "  pINT32(\"$name\", \"BITS\") &&\n";
	} else {
	    print "%%Unknown type: $typ\n";
	}
	
	print "  pEND(name)\n";
	print "  || pERROR(name);\n";
	print "}\n\n";
	    
	$name = undef;
	$req = undef;
	next;
    }

    print "%% Error: $_\n";
}

