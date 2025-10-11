#include "Pressure.hpp"
Pressure::Pressure() {
}
Pressure::~Pressure() {
}
float Pressure::Calc(float fArea, float fN) {
    return fN / fArea;
}
