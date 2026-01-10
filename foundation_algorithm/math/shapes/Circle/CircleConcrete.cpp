#include "CircleConcrete.hpp"
#include <cmath>

CircleConcrete::CircleConcrete() {
}

CircleConcrete::CircleConcrete(unsigned int nDiameter) {
    this->m_nDiameter = nDiameter;
}

CircleConcrete::~CircleConcrete() {
}

float CircleConcrete::CalcCircumference() {
    return M_PI * (float)this->m_nDiameter;
}

float CircleConcrete::CalcArea() {
    float fRadius = this->CalcRadius();
    return powf(fRadius, 2) * M_PI;
}

float CircleConcrete::CalcRadius() {
    return this->m_nDiameter / 2;
}
