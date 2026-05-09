#ifndef AtkinSieve_hpp
#define AtkinSieve_hpp
#include "BaseSieve.hpp"
class AtkinSieve : BaseSieve {
public:
    std::vector<unsigned long long> Sieve(unsigned long long llValue) override;
};
#endif /* AtkinSieve_hpp */
