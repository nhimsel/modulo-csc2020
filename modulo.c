#include <stdio.h>
#include <stdbool.h>

int modulo(int n, int mod);

int main()
{
    int a=1;
    int b=1;

    //get user input
    printf("%s", "Enter the value:");
    scanf("%d", &a);
    printf("%s", "Mod by:");
    scanf("%d", &b);

    //printf("%d\n", a%b);
    
    printf("%d mod %d = ", a, b);
    printf("%d\n", modulo(a,b));
    return 0;
}

int modulo(int n, int mod)
{
    //should always return the same result as %

    //make n positive for the operations
    bool wasNeg=false;
    if (n<0) 
    {
        n*=-1;
        wasNeg=true;
    }

    //make mod positive for the operations
    if (mod<0)
    {
        mod*=-1;
    }

    //subtract mod from n until the result would be negative
    while (n>=mod)
    {
        n-=mod;
    }

    //if n was negative, make the remainder negative
    if (wasNeg)
    {
        n*=-1;
    }

    //n is the remainder
    return n;
}