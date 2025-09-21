#include "Weight.hpp"
Weight::Weight() {
}

Weight::~Weight() {
}

float Weight::CalcByQualityAndGravity(float fQuality, float fGravity) {
    return fQuality * 0.01f * fGravity;
}

float Weight::CalcOnEarth(float fQuality) {
    return this->CalcByQualityAndGravity(fQuality, 1);
}

float Weight::CalcOnMoon(float fQuality) {
    return this->CalcByQualityAndGravity(fQuality, 0.16f);
}
