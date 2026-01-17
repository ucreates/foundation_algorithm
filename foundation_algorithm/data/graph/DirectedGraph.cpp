#include "DirectedGraph.hpp"
#include <stdio.h>
#include <stdlib.h>
const int DirectedGraph::MaxVertexSize = 5;

DirectedGraph::DirectedGraph() {
    this->m_pVertexTable = new Vertex *[DirectedGraph::MaxVertexSize];
    this->m_nAdjancencyMatrix = new int *[DirectedGraph::MaxVertexSize];
    for (int i = 0; i < DirectedGraph::MaxVertexSize; i++) {
        this->m_nAdjancencyMatrix[i] = new int[DirectedGraph::MaxVertexSize];
    }
    this->m_nSize = 0;
}

DirectedGraph::~DirectedGraph() {
}

void DirectedGraph::AddVertex(const char *pchData) {
    Vertex *pVertex = new Vertex;
    pVertex->pchData = pchData;
    pVertex->bVisited = false;
    this->m_pVertexTable[this->m_nSize] = pVertex;
    this->m_nSize++;
}

void DirectedGraph::AddEdge(int nFrom, int nTo) {
    this->m_nAdjancencyMatrix[nFrom][nTo] = 1;
}

void DirectedGraph::Search() {
    printf("\n");
    printf("【Search Result】\n");
    Vertex *pVertex = this->m_pVertexTable[0];
    pVertex->bVisited = true;
    printf("%s", pVertex->pchData);
    this->Push(0);
    while (!this->IsEmpty()) {
        int nRow = this->Peek();
        int nColumn = this->FindNotVisitedVertex(nRow);
        if (-1 == nColumn) {
            this->Pop();
        } else {
            Vertex *pVertex = this->m_pVertexTable[nColumn];
            pVertex->bVisited = true;
            printf("->%s", pVertex->pchData);
            this->Push(nColumn);
        }
    }
    printf("\n");
    this->Clear();
    return;
}

void DirectedGraph::Write() {
    printf("【Graph】\n");
    printf(" ");
    for (int i = 0; i < DirectedGraph::MaxVertexSize; i++) {
        Vertex *pVertex = this->m_pVertexTable[i];
        printf("%s", pVertex->pchData);
    }
    printf("\n");
    for (int i = 0; i < DirectedGraph::MaxVertexSize; i++) {
        Vertex *pVertex = this->m_pVertexTable[i];
        printf("%s", pVertex->pchData);
        for (int j = 0; j < DirectedGraph::MaxVertexSize; j++) {
            printf("%d", this->m_nAdjancencyMatrix[i][j]);
        }
        printf("\n");
    }
}

void DirectedGraph::Clear() {
    for (int i = 0; i < this->m_nSize; i++) {
        this->m_pVertexTable[i]->bVisited = false;
    }
}

int DirectedGraph::FindNotVisitedVertex(int nRow) {
    int nResult = -1;
    for (int nColmun = 0; nColmun < this->m_nSize; nColmun++) {
        if (1 == this->m_nAdjancencyMatrix[nRow][nColmun] && !this->m_pVertexTable[nColmun]->bVisited) {
            nResult = nColmun;
            break;
        }
    }
    return nResult;
}
