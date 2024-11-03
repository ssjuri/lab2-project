#include <stdio.h>

// 함수 선언
int add(int, int);
int subtract(int, int);
int multiply(int, int);
int divide(int, int);

int main() {
    int a = 10, b = 5;
    printf("Add: %d\n", add(a, b));
    printf("Subtract: %d\n", subtract(a, b));
    printf("Multiply: %d\n", multiply(a, b));
    printf("Divide: %d\n", divide(a, b));
    return 0;
}

