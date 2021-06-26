#!/usr/bin/perl
open (DNA, '<','data.txt') or die "Can't open file";
$dataset = <DNA> ;
close(DNA) or die "Can't open file";

my(%genetic_code_word) = (
		'AUC' => 'ILE',
		'AUA' => 'ILE',
		'AUG' => 'MET',
		'GUA' => 'VAL',
		'GUG' => 'VAL',
		'GCG' => 'ALA',
		'GAU' => 'ASP',
		'GAC' => 'ASP', 
		'GAA' => 'GLU',
		'GAG' => 'GLU',
		'GGU' => 'GLY',
		'GGC' => 'GLY',
		'GGA' => 'GLY',
		'GGG' => 'GLY',  
		'UUG' => 'LEU',
		'CUU' => 'LEU',
		'CUC' => 'LEU',
		'AGU' => 'SER',
		'AGC' => 'SER',
		'ACU' => 'THR',
		'ACC' => 'THR',
		'ACA' => 'THR',
		'ACG' => 'THR',
		'AAU' => 'ASN',
		'AAC' => 'ASN',
		'AAA' => 'LYS',
		'AAG' => 'LYS',
		'GUU' => 'VAL',
		'GUC' => 'VAL',
		'UAU' => 'TYR',
		'UAC' => 'TYR',
		'UAA' => 'STOP',
		'UAG' => 'STOP',
		'UGA' => 'STOP',
		'UGU' => 'CYS',
		'UGC' => 'CYS',
		'UGG' => 'TRP',
		'CCU' => 'PRO',
		'CCC' => 'PRO',
		'CCA' => 'PRO',
		'CCG' => 'PRO',
		'UUU' => 'PHE',    
		'UUC' => 'PHE',
		'UUA' => 'LEU',
		'CUA' => 'LEU',
		'CUG' => 'LEU',
		'UCU' => 'SER',
		'UCC' => 'SER',
		'UCA' => 'SER',
		'UCG' => 'SER',
		'CGU' => 'ARG',
		'CGC' => 'ARG',
		'CGA' => 'ARG',
		'CGG' => 'ARG',
		'AGA' => 'ARG',
		'AGG' => 'ARG',
		'AUU' => 'ILE',
		'CAU' => 'HIS',
		'CAC' => 'HIS',
		'CAA' => 'GLN',
		'CAG' => 'GLN',
		'GCU' => 'ALA',
		'GCC' => 'ALA',
		'GCA' => 'ALA',
		
	);
	my(%genetic_code_char) = (
		'UAA' => '.',
		'UAG' => '.',
		'UGA' => '.',
		'UGU' => 'C',
		'UGC' => 'C',
		'UGG' => 'W',
		'CCU' => 'P',
		'CCC' => 'P',
		'CCA' => 'P',
		'AUA' => 'I',
		'AUG' => 'M',
		'ACU' => 'T',
		'ACC' => 'T',
		'CGC' => 'R',
		'CGA' => 'R',
		'CGG' => 'R',
		'UUU' => 'F',    
		'UUC' => 'F',
		'UUA' => 'L',
		'UUG' => 'L',
		'CUU' => 'L',
		'CUC' => 'L',
		'CUA' => 'L',
		'CUG' => 'L',
		'UCU' => 'S',
		'GAA' => 'E',
		'GAG' => 'E',
		'GGU' => 'G',
		'GGC' => 'G',
		'GGA' => 'G',
		'GGG' => 'G',
		'CCG' => 'P',
		'CAU' => 'H',
		'CAC' => 'H',
		'CAA' => 'Q',
		'CAG' => 'Q',
		'CGU' => 'R',
		'ACA' => 'T',
		'ACG' => 'T',
		'AAU' => 'N',
		'AAC' => 'N',
		'AAA' => 'K',
		'AAG' => 'K',
		'GUU' => 'V',
		'GUC' => 'V',
		'GUA' => 'V',
		'GUG' => 'V',
		'GCU' => 'A',
		'GCC' => 'A',
		'GCA' => 'A',
		'GCG' => 'A',
		'GAU' => 'D',
		'GAC' => 'D', 
		'UCC' => 'S',
		'UCA' => 'S',
		'UCG' => 'S',
		'AGU' => 'S',
		'AGC' => 'S',
		'UAU' => 'Y',
		'UAC' => 'Y',
		'AGA' => 'R',
		'AGG' => 'R',
		'AUU' => 'I',
		'AUC' => 'I',  
	);

	$dna_len = length($dataset);
	
	print ("\n DNA  ->			");
	for ($i = 0 ; $i < $dna_len; $i++ )  { 
		@dna_char[$i] = substr( $dataset, $i, 1);
		print " @dna_char[$i]";
	}
	
	print ("\n Counterpart  ->	        ");
	for ($i = 0 ; $i < $dna_len; $i++ )  { 
			if(@dna_char[$i] eq 'A') { 
				@counterpart[$i]="T";
				@rna[$i]="U";
			}
    
			elsif(@dna_char[$i] eq 'T') { 
				@counterpart[$i]="A";
				@rna[$i]="A";
			}
        
			elsif(@dna_char[$i] eq 'C') { 
				@counterpart[$i]="G";
				@rna[$i]="G";
			}
    
			elsif(@dna_char[$i] eq 'G') { 
				@counterpart[$i]="C";
				@rna[$i]="C";
			}		
		print " @counterpart[$i]";
	}
	
	print ("\n RNA  ->			");
	for ($i = 0 ; $i < $dna_len; $i++ )  {
		print " @rna[$i]";
	}
	$j=0;
	for ($i = 0 ; $i < $dna_len-3; $i=$i+3 )  {
			@codon[$j]=@rna[$i].@rna[$i+1].@rna[$i+2];
			$j=$j+1;				
	}
	if($dna_len-$i==3){
		@codon[$j]=@rna[$i].@rna[$i+1].@rna[$i+2];
		$j=$j+1;
	}
	elsif($dna_len-$i==1){
		@codon[$j]=@rna[$i];
		$j=$j+1;
	}
	elsif($dna_len-$i==2){
		@codon[$j]=@rna[$i].@rna[$i+1];
		$j=$j+1;
	}
	print("\n mRNA (Codon) ->	     ");
	for ($i = 0 ; $i <$j; $i++)  {
		print "    @codon[$i]";
	}
		
	print("\n PROTEIN  ->	 	         ");
	for ($i = 0 ; $i <$j; $i++) {     
	    if( exists ($genetic_code_word{@codon[$i]}) ) {
		@result_word[$i] = $genetic_code_word{@codon[$i]};
		print "$genetic_code_word{@codon[$i]}    ";
	    }
	}
	print("\n Sequence of Amino Acids  ->     ");
	for ($i = 0 ; $i <$j; $i++) {     
	    if( exists ($genetic_code_char{@codon[$i]}) ) {
		@result_letter[$i] = $genetic_code_char{@codon[$i]};
		print "$genetic_code_char{@codon[$i]}";
	    }
	}
	print("\n");

	open(RESULT, "+>result.txt") or die "Couldn't open file result.txt, $!";
	print RESULT @result_letter;
	print RESULT ("\n");
	close(RESULT) or die "Couldn't close file properly";
	
print("\n");