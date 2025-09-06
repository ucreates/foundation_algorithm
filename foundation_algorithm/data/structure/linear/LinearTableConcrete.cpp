#include "LinearTableConcrete.hpp"
#include "Macro.hpp"
#include <string.h>

LinearTableConcrete::LinearTableConcrete() {
    m_nTableSize = 0;
    m_nTable = new int[m_nTableSize];
}

LinearTableConcrete::~LinearTableConcrete() {
    SAFE_DELETE_ARRAY(m_nTable);
}

void LinearTableConcrete::Append(int nValue) {
    int nTableSize = this->GetCount();
    int nNewTableSize = nTableSize + 1;
    int nTempArray[nNewTableSize];
    for (int i = 0; i < nTableSize; i++) {
        nTempArray[i] = m_nTable[i];
    }
    nTempArray[nNewTableSize - 1] = nValue;
    SAFE_DELETE_ARRAY(m_nTable);
    m_nTable = new int[nNewTableSize];
    memcpy(m_nTable, nTempArray, sizeof(nTempArray));
    m_nTableSize = nNewTableSize;
}

void LinearTableConcrete::Insert(int nIndex, int nValue) {
    int nTableSize = this->GetCount();
    int nNewTableSize = nTableSize + 1;
    int nTempArray[nNewTableSize];
    for (int i = 0; i < nTableSize; i++) {
        if (i < nIndex) {
            nTempArray[i] = m_nTable[i];
        } else {
            nTempArray[i + 1] = m_nTable[i];
        }
    }
    nTempArray[nIndex] = nValue;
    SAFE_DELETE_ARRAY(m_nTable);
    m_nTable = new int[nNewTableSize];
    memcpy(m_nTable, nTempArray, sizeof(nTempArray));
    m_nTableSize = nNewTableSize;
}

void LinearTableConcrete::Remove(int nIndex) {
    int nTableSize = this->GetCount();
    int nNewTableSize = nTableSize - 1;
    int nTempArray[nNewTableSize];
    int idx = 0;
    for (int i = 0; i < nTableSize; i++) {
        if (i == nIndex) {
            continue;
        }
        nTempArray[idx++] = m_nTable[i];
    }
    SAFE_DELETE_ARRAY(m_nTable);
    m_nTable = new int[nNewTableSize];
    memcpy(m_nTable, nTempArray, sizeof(nTempArray));
    m_nTableSize = nNewTableSize;
}

int LinearTableConcrete::Get(int nIndex) {
    return m_nTable[nIndex];
}

int LinearTableConcrete::GetCount() {
    return m_nTableSize;
}

int LinearTableConcrete::GetFirst() {
    return this->Get(0);
}

int LinearTableConcrete::GetLast() {
    int index = this->GetCount() - 1;
    return 0 <= index ? this->Get(index) : -1;
}
