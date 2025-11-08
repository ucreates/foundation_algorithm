#include "TriangleTemplate.hpp"

template <typename T> TriangleTemplate<T>::TriangleTemplate() {
}

template <typename T> TriangleTemplate<T>::~TriangleTemplate() {
}

template <typename T> TriangleTemplate<T>::TriangleTemplate(T tBottom, T tHeight) {
    this->m_tBottom = tBottom;
    this->m_tHeight = tHeight;
}

template <typename T> T TriangleTemplate<T>::CalcArea() {
    return this->m_tBottom * this->m_tHeight / static_cast<T>(2);
}

template class TriangleTemplate<int>;
template class TriangleTemplate<short>;
template class TriangleTemplate<long>;
template class TriangleTemplate<float>;
template class TriangleTemplate<double>;
