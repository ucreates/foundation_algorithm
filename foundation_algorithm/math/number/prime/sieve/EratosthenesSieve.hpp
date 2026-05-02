#ifndef EratosthenesSieve_hpp
#define EratosthenesSieve_hpp
#include "BaseSieve.hpp"
class EratosthenesSieve : BaseSieve {
public:
    std::vector<unsigned long long> Sieve(unsigned long long llValue) override;
};
#endif /* EratosthenesSieve_hpp */
