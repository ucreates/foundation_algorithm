#include "Sort.hpp"
#include "LinearTableConcrete.hpp"
#include "Macro.hpp"
#include <string.h>
Sort::Sort() {
    m_nTableSize = 0;
    m_nTable = new int[m_nTableSize];
}

Sort::~Sort() {
    SAFE_DELETE_ARRAY(m_nTable);
}

void Sort::Append(int nValue) {
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

void Sort::Bubble(SortOrder eOrder) {
    for (int i = 0; i < m_nTableSize - 1; i++) {
        int bSwap = false;
        for (int j = 0; j < m_nTableSize - i - 1; j++) {
            int a = m_nTable[j];
            int b = m_nTable[j + 1];
            bool bOrder = eOrder == SortOrder::Asc ? a > b : b > a;
            if (bOrder) {
                m_nTable[j] = b;
                m_nTable[j + 1] = a;
                bSwap = true;
            }
        }
        if (!bSwap) {
            break;
        }
    }
}

int Sort::Get(int nIndex) {
    return m_nTable[nIndex];
}

int Sort::GetCount() {
    return m_nTableSize;
}
