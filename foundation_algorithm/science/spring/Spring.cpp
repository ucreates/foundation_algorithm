#include "Spring.hpp"
Spring::Spring() {
}
Spring::~Spring() {
}
float Spring::CalcPower(float fWeight, float fSpringExtension) {
    return fSpringExtension / fWeight;
}
float Spring::CalcSpringExtension(float fWeight, float fN) {
    return fWeight * fN;
}
