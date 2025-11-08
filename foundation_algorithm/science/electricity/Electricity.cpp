#include "Electricity.hpp"

Electricity::Electricity() {
}
Electricity::~Electricity() {
}
int Electricity::CalcVoltage(int nAmpere, int nResistance) {
    return nAmpere * nResistance;
}
int Electricity::CalcAmpere(int nVoltage, int nResistance) {
    return nVoltage / nResistance;
}
