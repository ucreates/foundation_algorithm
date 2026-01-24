#ifndef OnewayCircularLinkedList_hpp
#define OnewayCircularLinkedList_hpp
#include "Node.hpp"
class OnewayCircularLinkedList {
private:
    Node **m_pNodeTable;
    int m_nTableSize;

public:
    OnewayCircularLinkedList();
    ~OnewayCircularLinkedList();
    void Append(char chData[]);
    void Write();
    int GetCount();
};
#endif /* OnewayCircularLinkedList_hpp */
