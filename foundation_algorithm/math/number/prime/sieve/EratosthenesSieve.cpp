#include "EratosthenesSieve.hpp"
#include <stdio.h>

std::vector<unsigned long long> EratosthenesSieve::Sieve(unsigned long long llValue) {
    std::vector<unsigned long long> vecResult(llValue);
    if (llValue < 2) {
        return vecResult;
    }
    for (unsigned long long i = 2; i < llValue; i++) {
        vecResult[i] = i;
    }
    for (unsigned long long i = 2; i * i < llValue; ++i) {
        if (0 < vecResult[i]) {
            for (unsigned long long j = i * i; j < llValue; j += i) {
                vecResult[j] = 0;
            }
        }
    }
    for (std::vector<unsigned long long>::iterator it = vecResult.begin(); it != vecResult.end();) {
        if (*it == 0) {
            it = vecResult.erase(it);
        } else {
            ++it;
        }
    }
    return vecResult;
}
