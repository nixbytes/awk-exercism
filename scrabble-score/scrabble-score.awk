#!/usr/bin/gawk -f

BEGIN {
    split("AEIOULNRST", single_value_letters, "")
    split("DG", double_value_letters, "")
    split("BCMP", triple_value_letters, "")
    split("FHVWY", quadruple_value_letters, "")
    split("K", quintuple_value_letters, "")
    split("JX", octuple_value_letters, "")
    split("QZ", decuple_value_letters, "")

    for (i in single_value_letters) {
        letter_values[tolower(single_value_letters[i])] = 1
    }
    for (i in double_value_letters) {
        letter_values[tolower(double_value_letters[i])] = 2
    }
    for (i in triple_value_letters) {
        letter_values[tolower(triple_value_letters[i])] = 3
    }
    for (i in quadruple_value_letters) {
        letter_values[tolower(quadruple_value_letters[i])] = 4
    }
    for (i in quintuple_value_letters) {
        letter_values[tolower(quintuple_value_letters[i])] = 5
    }
    for (i in octuple_value_letters) {
        letter_values[tolower(octuple_value_letters[i])] = 8
    }
    for (i in decuple_value_letters) {
        letter_values[tolower(decuple_value_letters[i])] = 10
    }
}

{
    word = tolower($0)
    score = 0
    for (i = 1; i <= length(word); i++) {
        letter = substr(word, i, 1)
        score += letter_values[letter]
    }
    print toupper($0) "," score
}
