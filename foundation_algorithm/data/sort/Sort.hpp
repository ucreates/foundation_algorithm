#ifndef BubbleSort_hpp
#define BubbleSort_hpp
#include "SortOrder.hpp"
class Sort {
private:
    int *m_nTable;
    int m_nTableSize;

public:
    Sort();
    Sort(int nSize);
    ~Sort();
    void Append(int nValue);
    void Bubble(SortOrder eOrder);
    void Select(SortOrder eOrder);
    void Insert(SortOrder eOrder);
    void Heap(SortOrder eOrder);
    int Get(int nIndex);
    int GetCount();
};
#endif /* BubbleSort_hpp */
