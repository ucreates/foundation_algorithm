#ifndef Queue_hpp
#define Queue_hpp
#include "Node.hpp"
class Queue {
public:
    Queue();
    ~Queue();
    void Enqueue(char chData[]);
    Node *Dequeue();
    int GetCount();
    void Output();

private:
    Node *m_pHeadNode;
    Node *m_pTailNode;
    int m_nCount;
};
#endif /* Queue_hpp */
