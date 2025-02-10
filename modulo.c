#include <stdio.h>
#include <stdbool.h>

int modulo(int n, int mod);

int main()
{
    int a=1;
    int b=1;

    //get user input
    printf("%s", "Enter dividend:");
    scanf("%d", &a);
    printf("%s", "Enter divisor:");
    scanf("%d", &b);

    //printf("%d\n", a%b);
    
    printf("%d mod %d = ", a, b);
    printf("%d\n", modulo(a,b));
    return 0;
}

int modulo(int a, int b)
{
    int big = a;
    int small = b;

    if (b>a) //swap the values if b is larger
    {
        big = a;
        small = b;
    }

    while (big>=small)
    {
        big-=small;
    }

    return big;
}