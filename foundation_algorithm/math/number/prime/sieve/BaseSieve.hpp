#ifndef BaseSieve_hpp
#define BaseSieve_hpp
#include <vector>
class BaseSieve {
public:
    virtual std::vector<unsigned long long> Sieve(unsigned long long llValue);
};
#endif /* BaseSieve_hpp */
