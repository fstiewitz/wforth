// native c word accept_c accept 2 1
#include<stdio.h>
long accept_c(char* b, long l) {
    long i;
    int c = 1;
    for(i = 0; i < l; ++i) {
        c = fgetc(stdin);
        if(c == '\n' || c <= 0) break;
        b[i] = c;
    }
    if(i == l && (c != '\n' && c > 0)) {
        while(1) {
            c = fgetc(stdin);
            if(c == '\n' || c <= 0) break;
        }
    }
    return i;
}
