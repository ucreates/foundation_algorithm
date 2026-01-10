#ifndef Node_hpp
#define Node_hpp
struct Node {
    char chData[50];
    struct Node *pPrevNode;
    struct Node *pNextNode;
};
#endif /* Node_hpp */
