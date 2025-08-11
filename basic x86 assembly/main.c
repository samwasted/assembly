#include<stdio.h>
#include "add42.h"

int main(){
    int result;
    result = add42(30);
    printf("Result: %i\n", result);
    return 0;
}
// build command: gcc -m32 add42.o main.c -o ex11