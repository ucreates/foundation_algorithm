#include "BinarySearchTree.hpp"
#include "Macro.hpp"
#include <functional>
#include <stdio.h>

BinarySearchTree::BinarySearchTree() {
}

BinarySearchTree::~BinarySearchTree() {
    std::function<void(Node *, BinarySearchTree *)> fReleaseCallback;
    fReleaseCallback = [&fReleaseCallback](Node *pNode, BinarySearchTree *pTree) {
        if (NULL == pNode) {
            return;
        }
        fReleaseCallback(pNode->pLeft, pTree);
        fReleaseCallback(pNode->pRight, pTree);
        SAFE_DELETE(pNode);
        pTree->m_nCount--;
    };
    fReleaseCallback(this->m_pRoot, this);
}

Node *BinarySearchTree::Create(int nData) {
    Node *pNode = new Node();
    pNode->nData = nData;
    pNode->pRight = NULL;
    pNode->pLeft = NULL;
    this->m_nCount++;
    return pNode;
}

Node *BinarySearchTree::Remove(int nData) {
    // Root Nodeの場合は削除しない
    if (nData == this->m_pRoot->nData) {
        return NULL;
    }
    std::function<Node *(int, Node *, BinarySearchTree *)> fRemoveCallback;
    fRemoveCallback = [&fRemoveCallback](int nData, Node *pNode, BinarySearchTree *pTree) -> Node * {
        if (NULL == pNode) {
            return pNode;
        }
        int nCompareValue = nData - pNode->nData;
        if (0 < nCompareValue) {
            pNode->pRight = fRemoveCallback(nData, pNode->pRight, pTree);
        } else if (0 > nCompareValue) {
            pNode->pLeft = fRemoveCallback(nData, pNode->pLeft, pTree);
        } else if (NULL != pNode->pLeft && NULL != pNode->pRight) {
            Node *pMinNode = pTree->Search(SortOrder::Asc, pNode->pRight);
            pNode->nData = pMinNode->nData;
            pNode->pRight = fRemoveCallback(pNode->nData, pNode->pRight, pTree);
        } else {
            Node *pTmpNode = NULL != pNode->pLeft ? pNode->pLeft : pNode->pRight;
            pTree->m_nCount--;
            pNode = pTmpNode;
        }
        return pNode;
    };
    return fRemoveCallback(nData, this->m_pRoot, this);
}

Node *BinarySearchTree::Search(SortOrder eOrder, Node *pNode) {
    std::function<Node *(Node *, BinarySearchTree *)> fSearchCallback;
    if (SortOrder::Asc == eOrder) {
        fSearchCallback = [&fSearchCallback](Node *pNode, BinarySearchTree *pTree) -> Node * {
            if (NULL == pNode || 0 == pNode->nData) {
                return NULL;
            }
            if (NULL == pNode->pLeft) {
                return pNode;
            }
            return fSearchCallback(pNode->pLeft, pTree);
        };
    } else {
        fSearchCallback = [&fSearchCallback](Node *pNode, BinarySearchTree *pTree) -> Node * {
            if (NULL == pNode || 0 == pNode->nData) {
                return NULL;
            }
            if (NULL == pNode->pRight) {
                return pNode;
            }
            return fSearchCallback(pNode->pRight, pTree);
        };
    }
    return NULL == pNode ? fSearchCallback(this->m_pRoot, this) : fSearchCallback(pNode, this);
}

void BinarySearchTree::Insert(int nData) {
    if (NULL == this->m_pRoot) {
        this->m_pRoot = this->Create(nData);
    } else {
        std::function<void(int, Node *, BinarySearchTree *)> fInsertCallback;
        fInsertCallback = [&fInsertCallback](int nData, Node *pNode, BinarySearchTree *pTree) {
            int nCompareValue = nData - pNode->nData;
            if (nCompareValue < 0) {
                if (NULL == pNode->pLeft) {
                    pNode->pLeft = pTree->Create(nData);
                } else {
                    fInsertCallback(nData, pNode->pLeft, pTree);
                }
            } else if (nCompareValue > 0) {
                if (NULL == pNode->pRight) {
                    pNode->pRight = pTree->Create(nData);
                } else {
                    fInsertCallback(nData, pNode->pRight, pTree);
                }
            }
        };
        fInsertCallback(nData, this->m_pRoot, this);
    }
}

int BinarySearchTree::GetCount() {
    return this->m_nCount;
}

void BinarySearchTree::InOrderTraversal() {
    printf("【InOrderTraversal】\n");
    std::function<void(Node *)> fOrderCallback;
    fOrderCallback = [&fOrderCallback](Node *pNode) {
        if (NULL == pNode) {
            return;
        }
        fOrderCallback(pNode->pLeft);
        printf("%d\n", pNode->nData);
        fOrderCallback(pNode->pRight);
    };
    fOrderCallback(this->m_pRoot);
    return;
}

void BinarySearchTree::PreOrderTraversal() {
    printf("【PreOrderTraversal】\n");
    std::function<void(Node *)> orderCallback;
    orderCallback = [&orderCallback](Node *pNode) {
        if (NULL == pNode) {
            return;
        }
        printf("%d\n", pNode->nData);
        orderCallback(pNode->pLeft);
        orderCallback(pNode->pRight);
    };
    orderCallback(this->m_pRoot);
    return;
}

void BinarySearchTree::PostOrderTraversal() {
    printf("【PostOrderTraversal】\n");
    std::function<void(Node *)> orderCallback;
    orderCallback = [&orderCallback](Node *pNode) {
        if (NULL == pNode) {
            return;
        }
        orderCallback(pNode->pLeft);
        orderCallback(pNode->pRight);
        printf("%d\n", pNode->nData);
    };
    orderCallback(this->m_pRoot);
    return;
}
