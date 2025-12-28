#ifndef MiddleSquareHashTable_hpp
#define MiddleSquareHashTable_hpp
#include "BaseHashTable.hpp"
class MiddleSquareHashTable : public BaseHashTable {
public:
    MiddleSquareHashTable(int nCapacity);
    int GetHashCode(char *chKey) override;
};
#endif /* MiddleSquareHashTable_hpp */
