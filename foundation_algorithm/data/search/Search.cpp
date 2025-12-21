#include "Search.hpp"
#include "Macro.hpp"
#include <stdio.h>
#include <string.h>
Search::Search() {
    m_nTableSize = 0;
    m_nTable = new int[m_nTableSize];
}

Search::~Search() {
    SAFE_DELETE_ARRAY(m_nTable);
}

int Search::Binary(int nValue) {
    int nLow = 0;
    int nHigh = this->m_nTableSize;
    int nMid = 0;
    while (nLow <= nHigh) {
        nMid = (nLow + nHigh) / 2;
        if (this->m_nTable[nMid] == nValue) {
            return nMid;
        } else if (this->m_nTable[nMid] < nValue) {
            nLow = nMid++;
        } else if (this->m_nTable[nMid] > nValue) {
            nHigh = nMid--;
        }
    }
    return -1;
}

void Search::Append(int nValue) {
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

int Search::GetCount() {
    return m_nTableSize;
}
