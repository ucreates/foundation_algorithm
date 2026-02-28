#include "OnewayCircularLinkedList.hpp"
#include "Macro.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
OnewayCircularLinkedList::OnewayCircularLinkedList() {
    this->m_nTableSize = 0;
}

OnewayCircularLinkedList::~OnewayCircularLinkedList() {
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        printf("release::%s\n", pNode->chData);
        SAFE_DELETE(pNode);
    }
    SAFE_DELETE_ARRAY(this->m_pNodeTable);
}

void OnewayCircularLinkedList::Append(char chData[]) {
    Node *pNewNode = new Node();
    pNewNode->pPrevNode = NULL;
    pNewNode->pNextNode = NULL;
    strcpy(pNewNode->chData, chData);
    if (0 < this->m_nTableSize) {
        Node *pTailNode = this->m_pNodeTable[this->m_nTableSize - 1];
        pTailNode->pNextNode = pNewNode;
        pNewNode->pNextNode = this->m_pNodeTable[0];
    }
    int nNewTableSize = this->m_nTableSize + 1;
    Node *pNodeTempArray[nNewTableSize];
    for (int i = 0; i < this->m_nTableSize; i++) {
        pNodeTempArray[i] = this->m_pNodeTable[i];
    }
    pNodeTempArray[nNewTableSize - 1] = pNewNode;
    SAFE_DELETE_ARRAY(this->m_pNodeTable);
    this->m_pNodeTable = new Node *[nNewTableSize];
    memcpy(this->m_pNodeTable, pNodeTempArray, sizeof(pNodeTempArray));
    this->m_nTableSize = nNewTableSize;
}

void OnewayCircularLinkedList::Insert(int nPosition, char chData[]) {
    if (nPosition > this->m_nTableSize - 1) {
        printf("not found node\n");
        return;
    }
    Node *pNextNode = this->m_pNodeTable[0];
    int i = 0;
    while (pNextNode->pNextNode != NULL && i < nPosition) {
        pNextNode = pNextNode->pNextNode;
        i++;
    }
    Node *pNewNode = new Node();
    pNewNode->pPrevNode = NULL;
    pNewNode->pNextNode = NULL;
    strcpy(pNewNode->chData, chData);
    int nPreviewNodeIndex = nPosition != 0 ? i - 1 : this->m_nTableSize - 1;
    Node *pPreviewNode = this->m_pNodeTable[nPreviewNodeIndex];
    pPreviewNode->pNextNode = pNewNode;
    pNewNode->pNextNode = pNextNode;
    int nNewTableSize = this->m_nTableSize + 1;
    Node *pNodeTempArray[nNewTableSize];
    int nOldTableIndex = 0;
    for (int i = 0; i < nNewTableSize; i++) {
        if (nPosition == i) {
            pNodeTempArray[i] = pNewNode;
        } else {
            pNodeTempArray[i] = this->m_pNodeTable[nOldTableIndex];
            nOldTableIndex++;
        }
    }
    SAFE_DELETE_ARRAY(this->m_pNodeTable);
    this->m_pNodeTable = new Node *[nNewTableSize];
    memcpy(this->m_pNodeTable, pNodeTempArray, sizeof(pNodeTempArray));
    this->m_nTableSize = nNewTableSize;
}

void OnewayCircularLinkedList::Delete(int nPosition) {
    if (nPosition > this->m_nTableSize - 1) {
        printf("not found node\n");
        return;
    }
    Node *pDeleteNode = this->m_pNodeTable[nPosition];
    SAFE_DELETE(pDeleteNode);
    this->m_pNodeTable[nPosition] = NULL;
    int nNewTableSize = this->m_nTableSize - 1;
    Node *pNodeTempArray[nNewTableSize];
    int nTempArrayIndex = 0;
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        if (NULL == pNode) {
            continue;
        }
        pNodeTempArray[nTempArrayIndex] = pNode;
        if (i + 1 <= this->m_nTableSize) {
            pNode->pNextNode = this->m_pNodeTable[i + 1];
        }
        nTempArrayIndex++;
        if (nTempArrayIndex == nNewTableSize - 1) {
            pNode->pNextNode = pNodeTempArray[0];
        }
    }
    SAFE_DELETE_ARRAY(this->m_pNodeTable);
    this->m_pNodeTable = new Node *[nNewTableSize];
    memcpy(this->m_pNodeTable, pNodeTempArray, sizeof(pNodeTempArray));
    this->m_nTableSize = nNewTableSize;
}

void OnewayCircularLinkedList::Write() {
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        printf("%s\n", pNode->chData);
    }
}

int OnewayCircularLinkedList::GetCount() {
    return this->m_nTableSize;
}
