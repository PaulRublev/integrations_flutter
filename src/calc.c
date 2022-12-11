#include <stdlib.h>
#include <locale.h>
#include <stdio.h>

int get_length(char *text) {
    setlocale(LC_CTYPE, "");
    printf("%s", text);
    return mbstowcs(0, text, 0);
}