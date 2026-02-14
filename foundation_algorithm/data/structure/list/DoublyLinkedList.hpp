#ifndef DoublyLinkedList_hpp
#define DoublyLinkedList_hpp
#include "Node.hpp"
class DoublyLinkedList {
private:
    Node **m_pNodeTable;
    int m_nTableSize;

public:
    DoublyLinkedList();
    ~DoublyLinkedList();
    void Append(char chData[]);
    void Insert(int nPosition, char chData[]);
    void Delete(int nPosition);
    void Write();
    int GetCount();
};
#endif /* DoublyLinkedList_hpp */
