// This code is for testing purpose
#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main()
{
    char null = '\000';
    char s[32];
    char str[] = "helloworld\0helloworld";

    scanf("%s", s);
    printf("%lu\n%s\n", strlen(s), s);
    // for (int i = 0; i < strlen(str); i++) {
    //     printf("%c", str[i]);
    // }
    printf("%lu\n%s\n", strlen(str), str);

    return 0;
}
