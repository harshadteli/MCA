//Assignment No 2 : Q1 Structure
#include <stdio.h>

// Creating a structure called student
struct student
{
    char name[50];       // To store student name
    int age;             // To store student age
    float total_marks;   // To store total marks
};

// Function to read student details
struct student Read()
{
    struct student s;

    // Taking name from user
    printf("Enter name: ");
    scanf("%s", s.name);

    // Taking age from user
    printf("Enter age: ");
    scanf("%d", &s.age);

    // Taking total marks from user
    printf("Enter total marks: ");
    scanf("%f", &s.total_marks);

    // Returning the student details
    return s;
}

// Function to display student details and average
void display(struct student s1)
{
    float average;

    // Calculating average
    // Here we assume total marks are out of 300
    average = s1.total_marks / 3;

    // Displaying student information
    printf("\nName: %s", s1.name);
    printf("\nAge: %d", s1.age);
    printf("\nTotal Marks: %.2f", s1.total_marks);
    printf("\nAverage: %.2f\n", average);
}

// Function to find the first rank student
struct student ranker(struct student s1[])
{
    int i;
    int rank = 0;

    // Comparing marks of all 3 students
    for(i = 1; i < 3; i++)
    {
        // If current student's marks are greater
        // than ranker's marks, change rank
        if(s1[i].total_marks > s1[rank].total_marks)
        {
            rank = i;
        }
    }

    // Returning the first rank student's details
    return s1[rank];
}

// Main function
int main()
{
    struct student s[3];
    struct student first;

    int i;

    // Reading details of 3 students
    for(i = 0; i < 3; i++)
    {
        printf("\nEnter details of Student %d\n", i + 1);

        // Calling Read() function
        s[i] = Read();
    }

    // Displaying details of all 3 students
    printf("\n\n----- STUDENT DETAILS -----\n");

    for(i = 0; i < 3; i++)
    {
        printf("\nStudent %d", i + 1);

        // Calling display() function
        display(s[i]);
    }

    // Finding first rank student
    first = ranker(s);

    // Displaying first rank student's details
    printf("\n\n----- FIRST RANK STUDENT -----\n");

    printf("Name: %s\n", first.name);
    printf("Age: %d\n", first.age);
    printf("Total Marks: %.2f\n", first.total_marks);

    // Displaying average of first rank student
    printf("Average: %.2f\n", first.total_marks / 3);

    return 0;
//Assignment No 3  : Q1
#include <stdio.h>

// Function to swap two numbers
// We use pointers because C does not have direct call by reference
void swap(int *a, int *b)
{
    int temp;

    // Store value of a in temp
    temp = *a;

    // Copy value of b into a
    *a = *b;

    // Copy value of temp into b
    *b = temp;
}

int main()
{
    int a, b;

    // Taking input from user
    printf("Enter first number: ");
    scanf("%d", &a);

    printf("Enter second number: ");
    scanf("%d", &b);

    // Display before swapping
    printf("\nBefore swapping:");
    printf("\na = %d", a);
    printf("\nb = %d", b);

    // Calling swap function
    // Address of a and b is passed
    swap(&a, &b);

    // Display after swapping
    printf("\n\nAfter swapping:");
    printf("\na = %d", a);
    printf("\nb = %d", b);

    return 0;
}
//Assignment No 3 : Q2
#include <stdio.h>

// Function to swap two numbers
// We use pointers because C does not have direct call by reference
void swap(int *a, int *b)
{
    int temp;

    // Store value of a in temp
    temp = *a;

    // Copy value of b into a
    *a = *b;

    // Copy value of temp into b
    *b = temp;
}

int main()
{
    int a, b;

    // Taking input from user
    printf("Enter first number: ");
    scanf("%d", &a);

    printf("Enter second number: ");
    scanf("%d", &b);

    // Display before swapping
    printf("\nBefore swapping:");
    printf("\na = %d", a);
    printf("\nb = %d", b);

    // Calling swap function
    // Address of a and b is passed
    swap(&a, &b);

    // Display after swapping
    printf("\n\nAfter swapping:");
    printf("\na = %d", a);
    printf("\nb = %d", b);

    return 0;
}
//Assignment No 3:  Q3
#include <stdio.h>

// Creating a structure called Student
struct Student
{
    char name[50];      // To store name
    int age;            // To store age
    float total_marks;  // To store total marks
};

int main()
{
    // Creating an array of structure for 2 students
    struct Student s[2];

    // Creating a structure pointer
    struct Student *p;

    float average;
    float sum = 0;
    int i;

    // Pointer points to the first student
    p = s;

    // Taking details of 2 students
    for(i = 0; i < 2; i++)
    {
        printf("\nEnter details of Student %d\n", i + 1);

        printf("Enter name: ");
        scanf("%s", (p + i)->name);

        printf("Enter age: ");
        scanf("%d", &(p + i)->age);

        printf("Enter total marks: ");
        scanf("%f", &(p + i)->total_marks);

        // Adding total marks
        sum = sum + (p + i)->total_marks;
    }

    // Calculating average of total marks
    average = sum / 2;

    // Displaying student information
    printf("\n----- STUDENT DETAILS -----\n");

    for(i = 0; i < 2; i++)
    {
        printf("\nStudent %d", i + 1);

        printf("\nName: %s", (p + i)->name);
        printf("\nAge: %d", (p + i)->age);
        printf("\nTotal Marks: %.2f\n", (p + i)->total_marks);
    }

    // Displaying average
    printf("\nAverage of total marks = %.2f", average);

    return 0;
}
//End of the Assignment Here 




