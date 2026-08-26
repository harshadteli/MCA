#include <stdio.h>
struct Employees
{
    int emp_id;
    char name[20];
    int salary;
};

int main()
{
    struct Employees e[100];
    int i, n;

    printf("How many Employees: ");
    scanf("%d", &n);

    for(i = 0; i < n; i++)
    {
        printf("Enter Employee %d details:\n", i+1);
        printf("Enter ID: ");
        scanf("%d", &e[i].emp_id);
        printf("Enter Name: ");
        scanf("%s", e[i].name);
        printf("Enter Salary: ");
        scanf("%d", &e[i].salary);
    }

    for(i = 0; i < n; i++)
    {
        printf("\nEmployee %d Details\n", i+1);
        printf("ID: %d\n", e[i].emp_id);
        printf("Name: %s\n", e[i].name);
        printf("Salary: %d\n", e[i].salary);
    }

    return 0;
}