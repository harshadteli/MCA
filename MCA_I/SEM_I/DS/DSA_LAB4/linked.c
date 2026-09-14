#include <stdio.h>
#include <string.h>
#define MAX 100

char stack[MAX];
int top = -1;

void push(char c) {
    top++;
    stack[top] = c;
}

void pop() {
    top--;
}

int main() {
    char exp[MAX];
    int i, valid = 1;

    printf("Enter expression: ");
    scanf("%s", exp); // example: (a+b)*[c+d]

    for (i = 0; i < strlen(exp); i++) {
        char ch = exp[i];

        // If opening bracket, push
        if (ch == '(' || ch == '{' || ch == '[') {
            push(ch);
        }
        // If closing bracket, check
        else if (ch == ')' || ch == '}' || ch == ']') {
            if (top == -1) {
                valid = 0; // stack empty but closing found
                break;
            }
            else {
                // check matching pair
                if ((ch == ')' && stack[top] == '(') ||
                    (ch == '}' && stack[top] == '{') ||
                    (ch == ']' && stack[top] == '[')) {
                    pop();
                } else {
                    valid = 0; // not matching
                    break;
                }
            }
        }
    }

    if (valid == 1 && top == -1)
        printf("Expression is VALID\n");
    else
        printf("Expression is INVALID\n");

    return 0;
}