#include "Gcd.hpp"

long long Gcd::Euclid(long long llValueA, long long llValueB) {
    return llValueB != 0 ? Gcd::Euclid(llValueB, llValueA % llValueB) : llValueA;
}
