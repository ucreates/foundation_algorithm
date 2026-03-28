#include "TriangleConcrete.hpp"
#include "Macro.hpp"
#include <stdlib.h>

TriangleConcrete::TriangleConcrete() {
}

TriangleConcrete::~TriangleConcrete() {
    SAFE_DELETE(this->m_nEdges);
}

TriangleConcrete::TriangleConcrete(int nBottom, int nHeight) {
    this->m_nBottom = nBottom;
    this->m_nHeight = nHeight;
}

TriangleConcrete::TriangleConcrete(int *nEdges) {
    this->m_nEdges = new int[3];
    this->m_nEdges[0] = nEdges[0];
    this->m_nEdges[1] = nEdges[1];
    this->m_nEdges[2] = nEdges[2];
}

int TriangleConcrete::CalcArea() {
    return (this->m_nBottom * this->m_nHeight) / 2;
}

int *TriangleConcrete::CalcScale(int nScale, bool bMultipliedOrdivided) {
    if (bMultipliedOrdivided) {
        this->m_nEdges[0] *= nScale;
        this->m_nEdges[1] *= nScale;
        this->m_nEdges[2] *= nScale;
    } else {
        this->m_nEdges[0] /= nScale;
        this->m_nEdges[1] /= nScale;
        this->m_nEdges[2] /= nScale;
    }
    return this->m_nEdges;
}
