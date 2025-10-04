#include "Quality.hpp"
Quality::Quality() {
}

Quality::~Quality() {
}

float Quality::CalcByWeightAndGravity(float fWeight, float fGravity) {
    return 100 * fWeight / fGravity;
}

float Quality::CalcOnEarth(float fWeight) {
    return this->CalcByWeightAndGravity(fWeight, 1);
}

float Quality::CalcOnMoon(float fWeight) {
    return this->CalcByWeightAndGravity(fWeight, 0.16f);
}
