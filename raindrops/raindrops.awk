# These variables are initialized on the command line (using '-v'):
# - num

BEGIN {
    number = num

    if (number % 3 == 0) {
        result = "Pling"
    }
    if (number % 5 == 0) {
        result = result "Plang"
    }
    if (number % 7 == 0) {
        result = result "Plong"
    }
    
    if (result == "") {
        result = number
    }
    
    print result
}

