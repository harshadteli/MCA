#include <stdio.h>
int main()
{
    int a[100], size, i, max, min;

    printf("Enter Size of Array: ");
    scanf("%d", &size);

    printf("Enter %d elements: \n", size);
    for(i = 0; i < size; i++)
    {
        scanf("%d", &a[i]);
    }

    max = a[0];
    for(i = 0; i < size; i++)
    {
        if(a[i] > max)
        {
            max = a[i];
        }
    }
    printf("Maximum Value from the Array is %d\n", max);

    min = a[0];
    for(i = 0; i < size; i++)
    {
        if(a[i] < min)
        {
            min = a[i];
        }
    }
    printf("Minimum Value from the Array is %d", min);

    return 0;
}