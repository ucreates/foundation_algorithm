#include "Lcm.hpp"
#include "Gcd.hpp"

long long Lcm::Euclid(long long llValueA, long long llValueB) {
    long long llgcd = Gcd::Euclid(llValueA, llValueB);
    return llValueA / llgcd * llValueB;
}
