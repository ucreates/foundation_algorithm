#include "DoublyLinkedList.hpp"
#include "Macro.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
DoublyLinkedList::DoublyLinkedList() {
    this->m_nTableSize = 0;
}

DoublyLinkedList::~DoublyLinkedList() {
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        if (NULL != pNode) {
            printf("release::%s\n", pNode->chData);
            SAFE_DELETE(pNode);
        }
    }
    if (NULL != this->m_pNodeTable) {
        SAFE_DELETE_ARRAY(this->m_pNodeTable);
    }
}

void DoublyLinkedList::Append(char chData[]) {
    Node *pNewNode = new Node();
    pNewNode->pPrevNode = NULL;
    pNewNode->pNextNode = NULL;
    strcpy(pNewNode->chData, chData);
    if (0 < this->m_nTableSize) {
        Node *pTailNode = this->m_pNodeTable[this->m_nTableSize - 1];
        pTailNode->pNextNode = pNewNode;
        pNewNode->pPrevNode = pTailNode;
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

void DoublyLinkedList::Insert(int nPosition, char chData[]) {
    if (0 == nPosition) {
        printf("can't insert intto top\n");
        return;
    } else if (nPosition > this->m_nTableSize - 1) {
        printf("not found node\n");
        return;
    }
    Node *pInsertPositionNode = this->m_pNodeTable[0];
    int i = 0;
    while (pInsertPositionNode->pNextNode != NULL && i < nPosition) {
        pInsertPositionNode = pInsertPositionNode->pNextNode;
        i++;
    }
    Node *pNewNode = new Node();
    pNewNode->pPrevNode = NULL;
    pNewNode->pNextNode = NULL;
    strcpy(pNewNode->chData, chData);
    int nPreviewNodeIndex = i - 1;
    Node *pPreviewNode = this->m_pNodeTable[nPreviewNodeIndex];
    pPreviewNode->pNextNode = pNewNode;
    pNewNode->pPrevNode = pPreviewNode;
    int nNextNodeIndex = nPreviewNodeIndex + 1;
    Node *pNextNode = this->m_pNodeTable[nNextNodeIndex];
    pNextNode->pPrevNode = pNewNode;
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

void DoublyLinkedList::Delete(int nPosition) {
    if (nPosition > this->m_nTableSize - 1) {
        printf("not found node\n");
        return;
    }
    Node *pDeleteNode = this->m_pNodeTable[nPosition];
    SAFE_DELETE(pDeleteNode);
    this->m_pNodeTable[nPosition] = NULL;
    int nPreviewIndex = nPosition - 1;
    int nNextIndex = nPosition + 1;
    Node *pPrevNode = nPreviewIndex >= 0 ? this->m_pNodeTable[nPreviewIndex] : NULL;
    Node *pNextNode = nNextIndex <= this->m_nTableSize - 1 ? this->m_pNodeTable[nNextIndex] : NULL;
    if (NULL != pPrevNode) {
        pPrevNode->pNextNode = pNextNode;
    }
    if (NULL != pNextNode) {
        pNextNode->pPrevNode = pPrevNode;
    }
    int nNewTableSize = this->m_nTableSize - 1;
    Node *pNodeTempArray[nNewTableSize];
    int nTempArrayIndex = 0;
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        if (NULL == pNode) {
            continue;
        }
        pNodeTempArray[nTempArrayIndex] = pNode;
        nTempArrayIndex++;
    }
    SAFE_DELETE_ARRAY(this->m_pNodeTable);
    this->m_pNodeTable = new Node *[nNewTableSize];
    memcpy(this->m_pNodeTable, pNodeTempArray, sizeof(pNodeTempArray));
    this->m_nTableSize = nNewTableSize;
}

void DoublyLinkedList::Write() {
    for (int i = 0; i < this->m_nTableSize; i++) {
        Node *pNode = this->m_pNodeTable[i];
        printf("%s\n", pNode->chData);
        printf("preview::%s\n", pNode->pPrevNode->chData);
        printf("next::%s\n", pNode->pNextNode->chData);
    }
}

int DoublyLinkedList::GetCount() {
    return this->m_nTableSize;
}
