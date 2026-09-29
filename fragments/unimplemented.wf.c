// native c word unimplemented (unimplemented) 0 0
#include<stdio.h>
#include<stdlib.h>

struct lnk_t {
    struct lnk_t *link;
    char name[];
};

extern char *current[];
void unimplemented(char ***x) {
    char *w = (char*)*x;
    struct lnk_t *s = (void*)current[1];
    while((char*)s > w) {
        s = s->link;
    }
    printf("UNIMPLEMENTED WORD %s\n", s->name);
    exit(1);
}
