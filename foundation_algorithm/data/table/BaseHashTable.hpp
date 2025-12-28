#ifndef HashTable_hpp
#define HashTable_hpp
#include "HashTableNode.hpp"
class BaseHashTable {
private:
    HashTableNode **m_pTable;
    int m_nTableSize;

protected:
    int m_nCapacity;

public:
    BaseHashTable(int nCapacity);
    ~BaseHashTable();
    void Put(char *pchkey, char *pchValue);
    char *Get(char *pchkey);
    virtual int GetHashCode(char *chKey);
    int GetCount();
    bool IsEmpty();
};
#endif /* HashTable_hpp */
