#include <stdio.h>

extern int add(int a, int b);

int main() {
    int a = 47, b = 12;
    int result = add(a, b);
    printf("%d + %d = %d\n", a, b, result);
    return 0;
}

