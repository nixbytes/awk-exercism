#!/usr/bin/gawk -f

# BEGIN block is executed before processing the input.
BEGIN {
    # Define a mapping of DNA to RNA nucleotides
    dna_to_rna["G"] = "C"  # Guanine (G) in DNA is replaced by Cytosine (C) in RNA
    dna_to_rna["C"] = "G"  # Cytosine (C) in DNA is replaced by Guanine (G) in RNA
    dna_to_rna["T"] = "A"  # Thymine (T) in DNA is replaced by Adenine (A) in RNA
    dna_to_rna["A"] = "U"  # Adenine (A) in DNA is replaced by Uracil (U) in RNA
}

{
    rna_seq = ""  # Initialize an empty RNA sequence
    invalid = 0   # Initialize a flag to check for invalid characters
    
    # Process each character in the input DNA sequence
    for (i = 1; i <= length($0); i++) {
        char = substr($0, i, 1)  # Get the current character
        
        # Check if the character is a valid DNA nucleotide
        if (char in dna_to_rna) {
            rna_seq = rna_seq dna_to_rna[char]  # Add the RNA complement to the sequence
        } else {
            invalid = 1  # Set the invalid flag if an invalid character is found
            break  # Exit the loop if an invalid character is found
        }
    }
    
    # Check if invalid characters were found in the input
    if (invalid) {
        print "Invalid nucleotide detected."
        exit 1  # Exit with an error code
    } else {
        print rna_seq  # Print the RNA sequence
    }
}
