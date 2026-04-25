#include "Bit.hpp"

long long Bit::Get(long long llValue, long long llDigit) {
    long long llResult = (llValue >> (llDigit - 1)) & 0x01;
    return llResult;
}

int Bit::GetFigure(long long lValue) {
    std::string strResult = Bit::ToString(lValue);
    size_t nStartIndex = 0;
    for (size_t i = 0; i < strResult.length(); i++) {
        char chValue = strResult[i];
        if ('1' == chValue) {
            nStartIndex = i;
            break;
        }
    }
    size_t stResult = strResult.substr(nStartIndex, strResult.length() - 1).length();
    return static_cast<int>(stResult);
}

long long Bit::GetLeastSignificantBit(long long llValue) {
    return -llValue & llValue;
}

long long Bit::Set(long long llValue, long long llDigit, BitValue eBitValue) {
    long long llRsult = llValue;
    if (BitValue::Zero == eBitValue) {
        llRsult &= ~(1 << (llDigit - 1));
    } else {
        llRsult |= (1 << (llDigit - 1));
    }
    return llRsult;
}

long long Bit::Invert(long long llValue, long long llDigit) {
    printf("変換前:%s\n", Bit::ToString(llValue).c_str());
    long long llResult = 0 == Bit::Get(llValue, llDigit) ? llValue |= (1 << (llDigit - 1)) : llValue &= ~(1 << (llDigit - 1));
    printf("変換後:%s\n", Bit::ToString(llResult).c_str());
    return llResult;
}

long long Bit::Reverse(long long llValue) {
    return ~llValue;
}

long long Bit::Reverse(long long llValue, long long llDigit) {
    if (0 == llDigit) {
        printf("反転失敗:%lld\n", llValue);
        return llValue;
    }
    llValue ^= (1 << (llDigit - 1));
    return llValue;
}

long long Bit::CalcMultiplication(long long llValue, long long llN) {
    long long llResult = llValue << llN;
    return llResult;
}

long long Bit::CalcDivision(long long llValue, long long llN) {
    long long llResult = llValue >> llN;
    return llResult;
}

long long Bit::CalcModulo(long long llValue, long long llN) {
    long long llResult = llValue & (1 << llN) - 1;
    return llResult;
}

long long Bit::CreateMask(long long llN) {
    return (1 << llN) - 1;
}

long long Bit::CreateMostSignificantBitOne(long long llN) {
    return 1LL << (llN - 1);
}

bool Bit::IsEvenOdd(long long llValue) {
    return llValue & 1LL;
}

std::string Bit::ToString(long long lValue) {
    std::string strResult;
    for (int i = 1; i <= 64; i++) {
        long long llBit = lValue >> (i - 1) & 0x01;
        strResult = std::to_string(llBit) + strResult;
    }
    return strResult;
}
