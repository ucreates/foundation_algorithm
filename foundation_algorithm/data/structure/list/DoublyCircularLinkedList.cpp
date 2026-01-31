#include "DoublyCircularLinkedList.hpp"
#include "Macro.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
DoublyCircularLinkedList::DoublyCircularLinkedList() {
    m_nTableSize = 0;
}

DoublyCircularLinkedList::~DoublyCircularLinkedList() {
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        printf("release::%s\n", pNode->chData);
        free(pNode);
    }
}

void DoublyCircularLinkedList::Append(char chData[]) {
    Node *pNode = (Node *)malloc(sizeof(Node));
    strcpy(pNode->chData, chData);
    pNode->pNextNode = NULL;
    if (0 < this->m_nTableSize) {
        Node *pTailNode = m_pNodeTable[this->m_nTableSize - 1];
        pTailNode->pNextNode = pNode;
        pNode->pPrevNode = pTailNode;
    }
    int nNewTableSize = m_nTableSize + 1;
    Node *pNodeTempArray[nNewTableSize];
    for (int i = 0; i < this->m_nTableSize; i++) {
        pNodeTempArray[i] = m_pNodeTable[i];
    }
    pNodeTempArray[nNewTableSize - 1] = pNode;
    SAFE_DELETE(m_pNodeTable);
    m_pNodeTable = new Node *[m_nTableSize];
    memcpy(m_pNodeTable, pNodeTempArray, sizeof(pNodeTempArray));
    m_nTableSize = nNewTableSize;
}

void DoublyCircularLinkedList::Write() {
    Node *pNode = m_pNodeTable[this->m_nTableSize - 1];
    printf("tail::%s\n", pNode->chData);
    do {
        pNode = pNode->pPrevNode;
        if (NULL != pNode) {
            printf("prev::%s\n", pNode->chData);
        }
    } while (pNode != NULL);
    pNode = m_pNodeTable[0];
    printf("head::%s\n", pNode->chData);
    do {
        pNode = pNode->pNextNode;
        if (NULL != pNode) {
            printf("next::%s\n", pNode->chData);
        }
    } while (pNode != NULL);
}

int DoublyCircularLinkedList::GetCount() {
    return this->m_nTableSize;
}
