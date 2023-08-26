#!/usr/bin/gawk -f

BEGIN {
    # Define the default dialogue for the cases where the name is not given
    dialogue = "One for you, one for me."
}

# Next block
END{
    # If a input is provided and if use it in the dialogue variable
    
    if ($0 > 0) {
        print "One for " $0 ", one for me."
    } else {
        print dialogue
    }
}
