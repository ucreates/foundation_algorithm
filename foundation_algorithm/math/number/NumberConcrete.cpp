#include "NumberConcrete.hpp"
#include <stdio.h>
#include <typeinfo>
NumberConcrete::NumberConcrete() {
}

NumberConcrete::~NumberConcrete() {
}

int NumberConcrete::SizeOfNumber(int nValue1, int nValue2) {
    if (nValue1 < nValue2) {
        return 2;
    } else if (nValue1 > nValue2) {
        return 1;
    } else {
        return 0;
    }
}

int NumberConcrete::Plus(int nValue1, int nValue2) {
    return nValue1 + nValue2;
}

int NumberConcrete::Minus(int nValue1, int nValue2) {
    return nValue1 - nValue2;
}

int NumberConcrete::Multiplication(int nValue1, int nValue2) {
    return nValue1 * nValue2;
}

int NumberConcrete::Division(int nValue1, int nValue2) {
    return nValue1 / nValue2;
}

bool NumberConcrete::EvenOddJudgment(int nValue) {
    return 0 == nValue % 2;
}
