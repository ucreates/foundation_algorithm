#ifndef Stack_hpp
#define Stack_hpp
#include "Node.hpp"
class Stack {
public:
    Stack();
    ~Stack();
    void Push(char chData[]);
    Node *Pop();
    int GetCount();
    void Output();

private:
    Node *m_pTopNode;
    int m_nCount;
};
#endif /* Stack_hpp */
