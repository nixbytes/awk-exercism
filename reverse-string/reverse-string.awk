{
    original = $0
    reversed = ""

    for (i = length(original); i >= 1; i--) {
        reversed = reversed substr(original, i, 1)
    }
    print reversed
}
