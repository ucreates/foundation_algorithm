#ifndef BinarySearchTree_hpp
#define BinarySearchTree_hpp
#include "Node.hpp"
#include "SortOrder.hpp"
#include <string.h>
class BinarySearchTree {
public:
    BinarySearchTree();
    ~BinarySearchTree();
    Node *Create(int nData);
    Node *Remove(int nData);
    Node *Search(SortOrder eOrder, Node *pNode = NULL);
    void Insert(int newData);
    void InOrderTraversal();
    void PreOrderTraversal();
    void PostOrderTraversal();
    int GetCount();

private:
    Node *m_pRoot;
    int m_nCount;
};
#endif /* BinarySearchTree_hpp */
