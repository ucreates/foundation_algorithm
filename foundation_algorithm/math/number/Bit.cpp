#include "Bit.hpp"

long long Bit::Get(long long llValue, long long llDigit) {
    long long llResult = (llValue >> (llDigit - 1)) & 0x01;
    return llResult;
}

long long Bit::Invert(long long llValue, long long llDigit) {
    printf("変換前:%s\n", Bit::ToString(llValue).c_str());
    long long llResult = 0 == Bit::Get(llValue, llDigit) ? llValue |= (1 << (llDigit - 1)) : llValue &= ~(1 << (llDigit - 1));
    printf("変換後:%s\n", Bit::ToString(llResult).c_str());
    return llResult;
}

std::string Bit::ToString(long long lValue) {
    std::string strResult;
    for (int i = 1; i <= 64; i++) {
        long long llBit = lValue >> (i - 1) & 0x01;
        strResult = std::to_string(llBit) + strResult;
    }
    return strResult;
}
