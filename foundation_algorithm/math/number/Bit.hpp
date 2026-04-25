#ifndef Bit_hpp
#define Bit_hpp
#include "BitValue.hpp"
#include <string>
class Bit {
public:
    Bit();
    ~Bit();
    static long long Get(long long llValue, long long llDigit);
    static int GetFigure(long long lValue);
    static long long GetLeastSignificantBit(long long llValue);
    static long long Set(long long llValue, long long llDigit, BitValue eBitValue = BitValue::Zero);
    static long long Invert(long long llValue, long long llDigit);
    static long long Reverse(long long llValue);
    static long long Reverse(long long llValue, long long llDigit);
    static long long CalcMultiplication(long long llValue, long long llN);
    static long long CalcDivision(long long llValue, long long llN);
    static long long CalcModulo(long long llValue, long long llN);
    static long long CreateMask(long long llN);
    static long long CreateMostSignificantBitOne(long long llN);
    static bool IsEvenOdd(long long llValue);
    static std::string ToString(long long lValue);
};
#endif /* Bit_hpp */
