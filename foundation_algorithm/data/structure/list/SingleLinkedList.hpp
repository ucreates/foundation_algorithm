#ifndef SingleLinkList_hpp
#define SingleLinkList_hpp
#include "Node.hpp"
class SingleLinkedList {
private:
    Node **m_pNodeTable;
    int m_nTableSize;

public:
    SingleLinkedList();
    ~SingleLinkedList();
    void Append(char chData[]);
    void Insert(int nPosition, char chData[]);
    void Delete(int nPosition);
    void Write();
    int GetCount();
};
#endif /* SingleLinkList_hpp */
