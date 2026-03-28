#include "TriangleTemplate.hpp"

template <typename T> TriangleTemplate<T>::TriangleTemplate() {
}

template <typename T> TriangleTemplate<T>::~TriangleTemplate() {
}

template <typename T> TriangleTemplate<T>::TriangleTemplate(T tBottom, T tHeight) {
    this->m_tBottom = tBottom;
    this->m_tHeight = tHeight;
}

template <typename T> TriangleTemplate<T>::TriangleTemplate(T *tEdges) {
    this->m_tEdges = new T[3];
    this->m_tEdges[0] = tEdges[0];
    this->m_tEdges[1] = tEdges[1];
    this->m_tEdges[2] = tEdges[2];
}

template <typename T> T TriangleTemplate<T>::CalcArea() {
    return this->m_tBottom * this->m_tHeight / static_cast<T>(2);
}

template <typename T> T *TriangleTemplate<T>::CalcScale(T tScale, bool bMultipliedOrdivided) {
    if (bMultipliedOrdivided) {
        this->m_tEdges[0] *= tScale;
        this->m_tEdges[1] *= tScale;
        this->m_tEdges[2] *= tScale;
    } else {
        this->m_tEdges[0] /= tScale;
        this->m_tEdges[1] /= tScale;
        this->m_tEdges[2] /= tScale;
    }
    return this->m_tEdges;
}

template class TriangleTemplate<int>;
template class TriangleTemplate<short>;
template class TriangleTemplate<long>;
template class TriangleTemplate<float>;
template class TriangleTemplate<double>;
