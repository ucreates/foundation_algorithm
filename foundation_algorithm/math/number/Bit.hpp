#ifndef Bit_hpp
#define Bit_hpp
#include <string>
class Bit {
public:
    Bit();
    ~Bit();
    static long long Get(long long llValue, long long llDigit);
    static int GetFigure(long long lValue);
    static long long Invert(long long llValue, long long llDigit);
    static long long Reverse(long long llValue);
    static long long Reverse(long long llValue, long long llDigit);
    static long long CalcMultiplication(long long llValue, long long llN);
    static long long CalcDivision(long long llValue, long long llN);
    static long long CalcModulo(long long llValue, long long llN);
    static long long CreateMask(long long llN);
    static std::string ToString(long long lValue);
};
#endif /* Bit_hpp */
