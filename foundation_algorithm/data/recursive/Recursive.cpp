#include "Recursive.hpp"

Recursive::Recursive() {
}
Recursive::~Recursive() {
}
long Recursive::Execute(int nValue) {
    if (1 == nValue) {
        return nValue;
    } else {
        return this->Execute(nValue - 1) * nValue;
    }
}
