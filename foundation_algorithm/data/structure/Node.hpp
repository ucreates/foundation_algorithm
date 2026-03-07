#ifndef Node_hpp
#define Node_hpp
struct Node {
    char chData[50];
    int nData;
    struct Node *pPrevNode;
    struct Node *pNextNode;
    struct Node *pRight;
    struct Node *pLeft;
};
#endif /* Node_hpp */
