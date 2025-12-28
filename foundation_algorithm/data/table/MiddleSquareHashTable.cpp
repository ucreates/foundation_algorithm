#include "MiddleSquareHashTable.hpp"
#include <math.h>

MiddleSquareHashTable::MiddleSquareHashTable(int nCapacity) : BaseHashTable(nCapacity) {
}

int MiddleSquareHashTable::GetHashCode(char *chKey) {
    int nNum = 0;
    char chNum = 0;
    for (int i = 0; (chNum = chKey[i]) != '\0'; i++) {
        nNum += (int)chNum;
    }
    double dAvg = nNum * (pow(5, 0.5f) - 1) / 2;
    double dNumeric = dAvg - floor(dAvg);
    double ret = floor(dNumeric * this->m_nCapacity);
    return (int)ret;
}
