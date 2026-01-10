#include "Stack.hpp"
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
Stack::Stack() {
}

Stack::~Stack() {
    Node *pTopNode = m_pTopNode;
    Node *pDeleteNode = pTopNode;
    while (NULL != pTopNode) {
        pDeleteNode = pTopNode;
        pTopNode = pTopNode->pNextNode;
        free(pTopNode);
    }
}

void Stack::Push(char chData[]) {
    Node *pNode = (Node *)malloc(sizeof(Node));
    strcpy(pNode->chData, chData);
    pNode->pNextNode = NULL;
    if (NULL == this->m_pTopNode) {
        this->m_pTopNode = pNode;
    } else {
        pNode->pNextNode = this->m_pTopNode;
        this->m_pTopNode = pNode;
    }
    this->m_nCount++;
}

Node *Stack::Pop() {
    if (NULL == this->m_pTopNode) {
        return NULL;
    }
    Node *pNode = m_pTopNode;
    m_pTopNode = m_pTopNode->pNextNode;
    pNode->pNextNode = NULL;
    this->m_nCount--;
    return pNode;
}

int Stack::GetCount() {
    return this->m_nCount;
}

void Stack::Output() {
    Node *pNode = NULL;
    while (NULL != (pNode = this->Pop())) {
        printf("%s\n", pNode->chData);
    }
}
