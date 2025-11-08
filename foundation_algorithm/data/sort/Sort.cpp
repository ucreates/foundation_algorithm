#include "Sort.hpp"
#include "LinearTableConcrete.hpp"
#include "Macro.hpp"
#include <functional>
#include <stdio.h>
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

void Sort::Select(SortOrder eOrder) {
    int nMinIndex = 0;
    for (int i = 0; i < m_nTableSize - 1; i++) {
        nMinIndex = i;
        int nMinValue = m_nTable[nMinIndex];
        for (int j = i; j < m_nTableSize - 1; j++) {
            bool bOrder = eOrder == SortOrder::Asc ? nMinValue > m_nTable[j + 1] : nMinValue < m_nTable[j + 1];
            if (bOrder) {
                nMinValue = m_nTable[j + 1];
                nMinIndex = j + 1;
            }
        }
        if (i != nMinIndex) {
            int nValue = m_nTable[i];
            m_nTable[i] = m_nTable[nMinIndex];
            m_nTable[nMinIndex] = nValue;
        }
    }
}

void Sort::Insert(SortOrder eOrder) {
    for (int i = 0; i < m_nTableSize; i++) {
        int nInsertElement = m_nTable[i];
        int nInsertPosition = i;
        for (int j = nInsertPosition - 1; j >= 0; j--) {
            bool bOrder = eOrder == SortOrder::Asc ? nInsertElement < m_nTable[j] : nInsertElement > m_nTable[j];
            if (bOrder) {
                m_nTable[j + 1] = m_nTable[j];
                nInsertPosition--;
            }
        }
        m_nTable[nInsertPosition] = nInsertElement;
    }
}

void Sort::Heap(SortOrder eOrder) {
    auto adjustCallback = [](int *nTable, int nCurrentIndex, int nTableSize, SortOrder eOrder) {
        int nNotLeafValue = nTable[nCurrentIndex];
        for (int i = 2 * nCurrentIndex + 1; i <= nTableSize; i = 2 * nCurrentIndex + 1) {
            bool bOrder = eOrder == SortOrder::Asc ? nTable[i] < nTable[i + 1] : nTable[i] > nTable[i + 1];
            if (i < nTableSize && bOrder) {
                i++;
            }
            bOrder = eOrder == SortOrder::Asc ? nNotLeafValue > nTable[i] : nNotLeafValue < nTable[i];
            if (bOrder) {
                break;
            }
            nTable[nCurrentIndex] = nTable[i];
            nCurrentIndex = i;
        }
        nTable[nCurrentIndex] = nNotLeafValue;
    };
    for (int i = (m_nTableSize - 1) / 2; i >= 0; i--) {
        adjustCallback(m_nTable, i, m_nTableSize - 1, eOrder);
    }
    for (int i = m_nTableSize - 1; i > 0; i--) {
        int nTempValue = m_nTable[0];
        m_nTable[0] = m_nTable[i];
        m_nTable[i] = nTempValue;
        adjustCallback(m_nTable, 0, i - 1, eOrder);
    }
}

void Sort::Quick(SortOrder eOrder) {
    std::function<void(int *, int, int, SortOrder)> sortCallback;
    sortCallback = [&sortCallback](int *nTable, int nLow, int nHigh, SortOrder eOrder) {
        if (nLow >= nHigh) {
            return;
        }
        int i = nLow, j = nHigh;
        int nThreshold = nTable[nLow];
        bool bThreshold1 = eOrder == SortOrder::Asc ? nTable[j] >= nThreshold : nTable[j] <= nThreshold;
        bool bThreshold2 = eOrder == SortOrder::Asc ? nTable[j] <= nThreshold : nTable[j] >= nThreshold;
        while (i < j) {
            while (i < j && bThreshold1)
                j--;
            if (i < j)
                nTable[i++] = nTable[j];
            while (i < j && bThreshold2)
                i++;
            if (i < j)
                nTable[j--] = nTable[i];
        }
        nTable[i] = nThreshold;
        sortCallback(nTable, nLow, i - 1, eOrder);
        sortCallback(nTable, i + 1, nHigh, eOrder);
    };
    sortCallback(m_nTable, 0, m_nTableSize - 1, eOrder);
}

int Sort::Get(int nIndex) {
    return m_nTable[nIndex];
}

int Sort::GetCount() {
    return m_nTableSize;
}
