#include "Basic.hpp"
#include <stdio.h>
Basic::Basic() {
}
Basic::~Basic() {
}
void Basic::Sequential() {
    int nValue1 = 1;
    int nValue2 = 2;
    int nValue3 = 3;
    printf("sequential::%d\n", nValue1);
    printf("sequential::%d\n", nValue2);
    printf("sequential::%d\n", nValue3);
    return;
}

void Basic::Branch(int value) {
    if (1 == value) {
        printf("first\n");
    } else if (2 == value) {
        printf("second\n");
    } else {
        printf("other\n");
    }
}

void Basic::Repeat(int count) {
    for (int i = 0; i < count; i++) {
        printf("repeatNumber::%d\n", i);
    }
}
