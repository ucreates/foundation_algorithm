#ifndef HashTableNode_hpp
#define HashTableNode_hpp
typedef struct HashTableNode {
    char *pchKey;
    char *pchValue;
    int nHash;
    struct HashTableNode *pNext;
} HashTableNode;

#endif /* HashTableNode_hpp */
