#include "Queue.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
Queue::Queue() {
}

Queue::~Queue() {
    Node *pHeadNode = this->m_pHeadNode;
    Node *pDeleteNode = pHeadNode;
    while (NULL != pHeadNode) {
        pDeleteNode = pHeadNode;
        pHeadNode = pHeadNode->pNextNode;
        free(pHeadNode);
    }
}

void Queue::Enqueue(char chData[]) {
    Node *pNode = (Node *)malloc(sizeof(Node));
    strcpy(pNode->chData, chData);
    pNode->pPrevNode = NULL;
    pNode->pNextNode = NULL;
    if (NULL == this->m_pHeadNode) {
        this->m_pHeadNode = pNode;
        this->m_pTailNode = this->m_pHeadNode;
    } else {
        pNode->pNextNode = this->m_pTailNode;
        this->m_pTailNode->pPrevNode = pNode;
        this->m_pTailNode = pNode;
    }
    this->m_nCount++;
}

Node *Queue::Dequeue() {
    Node *pNode = this->m_pHeadNode;
    if (NULL == pNode) {
        return NULL;
    }
    this->m_pHeadNode = this->m_pHeadNode->pPrevNode;
    pNode->pPrevNode = NULL;
    pNode->pNextNode = NULL;
    this->m_nCount--;
    return pNode;
}

int Queue::GetCount() {
    return this->m_nCount;
}

void Queue::Output() {
    Node *pNode = NULL;
    while (NULL != (pNode = this->Dequeue())) {
        printf("%s\n", pNode->chData);
    }
}
