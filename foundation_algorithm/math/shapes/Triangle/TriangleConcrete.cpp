#include "TriangleConcrete.hpp"

TriangleConcrete::TriangleConcrete() {
}

TriangleConcrete::~TriangleConcrete() {
}

TriangleConcrete::TriangleConcrete(int nBottom, int nHeight) {
    this->m_nBottom = nBottom;
    this->m_nHeight = nHeight;
}

int TriangleConcrete::CalcArea() {
    return (this->m_nBottom * this->m_nHeight) / 2;
}
