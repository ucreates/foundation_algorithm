#include "OnewayCircularLinkedList.hpp"
#include "Macro.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
OnewayCircularLinkedList::OnewayCircularLinkedList() {
    m_nTableSize = 0;
}

OnewayCircularLinkedList::~OnewayCircularLinkedList() {
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        printf("release::%s\n", pNode->chData);
        free(pNode);
    }
}

void OnewayCircularLinkedList::Append(char chData[]) {
    Node *pNode = (Node *)malloc(sizeof(Node));
    strcpy(pNode->chData, chData);
    pNode->pNextNode = NULL;
    if (0 < this->m_nTableSize) {
        Node *pTailNode = m_pNodeTable[this->m_nTableSize - 1];
        pTailNode->pNextNode = pNode;
    }
    int nNewTableSize = m_nTableSize + 1;
    Node *pNodeTempArray[nNewTableSize];
    for (int i = 0; i < this->m_nTableSize; i++) {
        pNodeTempArray[i] = m_pNodeTable[i];
    }
    pNodeTempArray[nNewTableSize - 1] = pNode;
    SAFE_DELETE_ARRAY(m_pNodeTable);
    m_pNodeTable = new Node *[m_nTableSize];
    memcpy(m_pNodeTable, pNodeTempArray, sizeof(pNodeTempArray));
    m_nTableSize = nNewTableSize;
}

void OnewayCircularLinkedList::Write() {
    Node *pNode = m_pNodeTable[0];
    printf("%s\n", pNode->chData);
    do {
        pNode = pNode->pNextNode;
        if (NULL != pNode) {
            printf("%s\n", pNode->chData);
        }
    } while (pNode != NULL);
}

int OnewayCircularLinkedList::GetCount() {
    return this->m_nTableSize;
}
