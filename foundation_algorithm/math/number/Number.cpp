#include "Number.hpp"
#include <stdio.h>
Number::Number() {
}
Number::~Number() {
}
void Number::SizeOfNumber(int number1, int number2) {
    if (number1 < number2) {
        printf("number1(%d)<number2(%d)\n", number1, number2);
    } else if (number1 > number2) {
        printf("number2(%d)<number1(%d)\n", number1, number2);
    } else {
        printf("number1=number2(%d)\n", number1);
    }
}
