#include "LinearTableTemplate.hpp"
#include "Macro.hpp"
#include <string.h>
template <typename T> LinearTableTemplate<T>::LinearTableTemplate() {
    m_nTableSize = 0;
    m_tTable = new T[m_nTableSize];
}

template <typename T> LinearTableTemplate<T>::~LinearTableTemplate() {
    SAFE_DELETE_ARRAY(m_tTable);
}

template <typename T> void LinearTableTemplate<T>::Append(T tValue) {
    int nTableSize = this->GetCount();
    int nNewTableSize = nTableSize + 1;
    T tTempArray[nNewTableSize];
    for (int i = 0; i < nTableSize; i++) {
        tTempArray[i] = m_tTable[i];
    }
    tTempArray[nNewTableSize - 1] = tValue;
    SAFE_DELETE_ARRAY(m_tTable);
    m_tTable = new T[nNewTableSize];
    memcpy(m_tTable, tTempArray, sizeof(tTempArray));
    m_nTableSize = nNewTableSize;
}

template <typename T> void LinearTableTemplate<T>::Insert(int nIndex, T tValue) {
    int nTableSize = this->GetCount();
    int nNewTableSize = nTableSize + 1;
    T tTempArray[nNewTableSize];
    for (int i = 0; i < nTableSize; i++) {
        if (i < nIndex) {
            tTempArray[i] = m_tTable[i];
        } else {
            tTempArray[i + 1] = m_tTable[i];
        }
    }
    tTempArray[nIndex] = tValue;
    SAFE_DELETE_ARRAY(m_tTable);
    m_tTable = new T[nNewTableSize];
    memcpy(m_tTable, tTempArray, sizeof(tTempArray));
    m_nTableSize = nNewTableSize;
}

template <typename T> void LinearTableTemplate<T>::Remove(int nIndex) {
    int nTableSize = this->GetCount();
    int nNewTableSize = nTableSize - 1;
    T tTempArray[nNewTableSize];
    int idx = 0;
    for (int i = 0; i < nTableSize; i++) {
        if (i == nIndex) {
            continue;
        }
        tTempArray[idx++] = m_tTable[i];
    }
    SAFE_DELETE_ARRAY(m_tTable);
    m_tTable = new T[nNewTableSize];
    memcpy(m_tTable, tTempArray, sizeof(tTempArray));
    m_nTableSize = nNewTableSize;
}

template <typename T> T LinearTableTemplate<T>::Get(int nIndex) {
    return m_tTable[nIndex];
}

template <typename T> int LinearTableTemplate<T>::GetCount() {
    return m_nTableSize;
}

template <typename T> T LinearTableTemplate<T>::GetFirst() {
    return this->Get(0);
}

template <typename T> T LinearTableTemplate<T>::GetLast() {
    int index = this->GetCount() - 1;
    return 0 <= index ? this->Get(index) : T();
}

template class LinearTableTemplate<int>;
template class LinearTableTemplate<short>;
template class LinearTableTemplate<long>;
template class LinearTableTemplate<float>;
template class LinearTableTemplate<double>;
template class LinearTableTemplate<bool>;
template class LinearTableTemplate<char>;
