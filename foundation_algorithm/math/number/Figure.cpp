#include "Figure.hpp"
#include <cmath>
template <typename T> int Figure<T>::Count(T tNumber, int nCount) {
    T nResult = tNumber / static_cast<T>(10);
    if (nResult <= 0) {
        return nCount;
    }
    return Figure::Count(nResult, ++nCount);
}

template <typename T> int Figure<T>::GetFigure(T tNumber, int nFigure) {
    T nResult = tNumber / static_cast<T>(pow(10, nFigure - 1));
    int result = static_cast<int>(nResult) % 10;
    return result;
}
template class Figure<short>;
template class Figure<int>;
template class Figure<long>;
template class Figure<long long>;
