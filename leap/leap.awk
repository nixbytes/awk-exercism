function is_leap_year(year) {
    if ((year % 4 == 0 && year % 100 != 0) || year % 400 == 0) {
        return 1;
    } else {
        return 0;
    }
}

BEGIN {
    getline year < "-";
    if (is_leap_year(year)) {
        print "true";
    } else {
        print "false";
    }
}
