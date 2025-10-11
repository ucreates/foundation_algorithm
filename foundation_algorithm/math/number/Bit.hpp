#ifndef Bit_hpp
#define Bit_hpp
#include <string>
class Bit {
public:
    Bit();
    ~Bit();
    static long long Get(long long llValue, long long llDigit);
    static long long Invert(long long llValue, long long llDigit);
    static int GetFigure(long long lValue);
    static std::string ToString(long long lValue);
};
#endif /* Bit_hpp */
