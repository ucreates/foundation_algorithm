#include "BaseHashTable.hpp"
#include "Macro.hpp"
#include <stdlib.h>
#include <string.h>

BaseHashTable::BaseHashTable(int nCapacity) {
    this->m_nTableSize = 0;
    this->m_nCapacity = nCapacity;
    this->m_pTable = new HashTableNode *[this->m_nCapacity];
}

BaseHashTable::~BaseHashTable() {
    for (int i = 0; i < this->m_nTableSize; i++) {
        HashTableNode *node = this->m_pTable[i];
        while (NULL != node) {
            HashTableNode *temp = node->pNext;
            node = node->pNext;
            free(temp);
        }
        free(node);
    }
}

void BaseHashTable::Put(char *pchKey, char *pchValue) {
    int nHash = this->GetHashCode(pchKey);
    HashTableNode *pNewNode = (HashTableNode *)malloc(sizeof(HashTableNode));
    pNewNode->pchKey = pchKey;
    pNewNode->pchValue = pchValue;
    pNewNode->nHash = nHash;
    pNewNode->pNext = NULL;
    HashTableNode *pNode = this->m_pTable[nHash];
    while (pNode != NULL) {
        if (0 == strcmp(pNode->pchKey, pchKey)) {
            pNode->pchValue = pchValue;
            return;
        }
        pNode = pNode->pNext;
    }
    pNewNode->pNext = this->m_pTable[nHash];
    this->m_pTable[nHash] = pNewNode;
    this->m_nTableSize++;
}

char *BaseHashTable::Get(char *pchkey) {
    if (NULL == pchkey) {
        return NULL;
    }
    int nHash = GetHashCode(pchkey);
    HashTableNode *pNode = this->m_pTable[nHash];
    while (pNode != NULL) {
        if (0 == strcmp(pNode->pchKey, pchkey)) {
            return pNode->pchValue;
        }
        pNode = pNode->pNext;
    }
    return NULL;
}

int BaseHashTable::GetHashCode(char *chKey) {
    return 0;
}

int BaseHashTable::GetCount() {
    return m_nTableSize;
}

bool BaseHashTable::IsEmpty() {
    return m_nTableSize == 0;
}
