#ifndef DoublyCircularLinkedList_hpp
#define DoublyCircularLinkedList_hpp
#include "Node.hpp"
class DoublyCircularLinkedList {
private:
    Node **m_pNodeTable;
    int m_nTableSize;

public:
    DoublyCircularLinkedList();
    ~DoublyCircularLinkedList();
    void Append(char chData[]);
    void Write();
    int GetCount();
};
#endif /* DoublyCircularLinkedList_hpp */
