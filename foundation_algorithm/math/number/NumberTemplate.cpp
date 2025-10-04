#include "NumberTemplate.hpp"
#include <cmath>
#include <stdio.h>
#include <typeinfo>
template <typename T> NumberTemplate<T>::NumberTemplate() {
}

template <typename T> NumberTemplate<T>::~NumberTemplate() {
}

template <typename T> int NumberTemplate<T>::SizeOfNumber(T tValue1, T tValue2) {
    if (tValue1 < tValue2) {
        return 2;
    } else if (tValue1 > tValue2) {
        return 1;
    } else {
        return 0;
    }
}

template <typename T> T NumberTemplate<T>::Plus(T tValue1, T tValue2) {
    return tValue1 + tValue2;
}

template <typename T> T NumberTemplate<T>::Minus(T tValue1, T tValue2) {
    return tValue1 - tValue2;
}

template <typename T> T NumberTemplate<T>::Multiplication(T tValue1, T tValue2) {
    return tValue1 * tValue2;
}

template <typename T> T NumberTemplate<T>::Division(T tValue1, T tValue2) {
    return tValue1 / tValue2;
}

template <typename T> bool NumberTemplate<T>::EvenOddJudgment(T tValue) {
    return 0 == fmodf(tValue, 2);
}

template class NumberTemplate<int>;
template class NumberTemplate<short>;
template class NumberTemplate<long>;
template class NumberTemplate<float>;
template class NumberTemplate<double>;
