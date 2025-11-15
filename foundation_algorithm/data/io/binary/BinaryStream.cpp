#include "BinaryStream.hpp"
#include "Bit.hpp"
#include "Macro.hpp"
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
const int BinaryStream::ByteByBit = 8;
const int BinaryStream::ShortByByte = 2;
const int BinaryStream::IntByByte = 4;
const int BinaryStream::FloatByByte = 4;
const int BinaryStream::DoubleByByte = 8;
BinaryStream::BinaryStream() {
}

BinaryStream::~BinaryStream() {
    this->m_pchBopdy -= this->m_lCurrentSeek;
    SAFE_DELETE(this->m_pchBopdy);
}

bool BinaryStream::Read(const char *pchFilePath) {
    FILE *pFile = fopen(pchFilePath, "rb");
    if (NULL == pFile) {
        return false;
    }
    this->m_lSize = this->GetFileSize(pFile);
    this->m_pchBopdy = (unsigned char *)malloc(this->m_lSize);
    size_t sResult = fread(this->m_pchBopdy, sizeof(char), this->m_lSize, pFile);
    if (sResult != this->m_lSize) {
        return false;
    }
    int nResult = fclose(pFile);
    if (0 != nResult) {
        return false;
    }
    return true;
}

unsigned char BinaryStream::ReadBitFigure(const int nBit) {
    const unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
    unsigned char chResult = chByteUnitData >> (nBit - 1);
    chResult &= 0x01;
    this->Seek(SeekOption::Move);
    return chResult;
}

unsigned long BinaryStream::ReadBit(const int nBits, const Endian eEndian) {
    unsigned long lResult = 0x00;
    if (0 == this->m_nBitIndex) {
        if (nBits <= BinaryStream::ByteByBit) {
            lResult = this->ReadBitInsideBoundary(0, nBits);
        } else {
            lResult = this->ReadBitOutsideBoundary(nBits, eEndian);
        }
    } else {
        if (nBits + this->m_nBitIndex <= BinaryStream::ByteByBit) {
            int nEndBitFigure = this->m_nBitIndex + nBits;
            lResult = this->ReadBitInsideBoundary(this->m_nBitIndex, nEndBitFigure);
        } else {
            const int nRemainderBitsOnData1 = BinaryStream::ByteByBit - this->m_nBitIndex;
            const int nRemainderBitsOnData2 = nBits - nRemainderBitsOnData1;
            unsigned long lResult1 = this->ReadBitInsideBoundary(this->m_nBitIndex, BinaryStream::ByteByBit);
            this->Seek(SeekOption::Move);
            unsigned long lResult2 = 0x00;
            if (nRemainderBitsOnData2 < BinaryStream::ByteByBit) {
                lResult2 = this->ReadBitInsideBoundary(0, nRemainderBitsOnData2);
            } else {
                lResult2 = this->ReadBitOutsideBoundary(nRemainderBitsOnData2, eEndian);
            }
            lResult = lResult1;
            if (Endian::Big == eEndian) {
                lResult |= lResult2 << nRemainderBitsOnData1;
            } else {
                lResult = lResult << nRemainderBitsOnData2;
                lResult |= lResult2;
            }
        }
    }
    return lResult;
}

unsigned long BinaryStream::ReadBitInsideBoundary(const int nStartBitFigure, const int nEndBitFigure) {
    this->m_chLatestLoadedByteUnitData = (*this->m_pchBopdy) & 0xff;
    const int nBits = nEndBitFigure - nStartBitFigure;
    const int nBitMask = 0xff >> (BinaryStream::ByteByBit - nBits);
    unsigned long lResult = this->m_chLatestLoadedByteUnitData >> nStartBitFigure;
    lResult &= nBitMask;
    this->m_nBitIndex = (this->m_nBitIndex + nBits) % BinaryStream::ByteByBit;
    return lResult;
}

unsigned long BinaryStream::ReadBitOutsideBoundary(int nBits, const Endian eEndian) {
    unsigned long lResult = 0x00;
    const int nLoadBytes = nBits / BinaryStream::ByteByBit;
    for (int i = 0; i < nLoadBytes; i++) {
        this->m_chLatestLoadedByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitShift = BinaryStream::ByteByBit * i;
        if (Endian::Big == eEndian) {
            lResult |= this->m_chLatestLoadedByteUnitData << nBitShift;
        } else {
            lResult = lResult << nBitShift;
            lResult |= this->m_chLatestLoadedByteUnitData;
        }
        this->Seek(SeekOption::Move);
    }
    const int nLoadBits = nBits % BinaryStream::ByteByBit;
    if (nLoadBits > 0) {
        this->m_chLatestLoadedByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitMask = 0xff >> (BinaryStream::ByteByBit - nLoadBits);
        int nBitShift = nLoadBytes * BinaryStream::ByteByBit + nLoadBits - 1;
        int nRemainderUnitData = this->m_chLatestLoadedByteUnitData & nBitMask;
        if (Endian::Big == eEndian) {
            lResult |= nRemainderUnitData << nBitShift;
        } else {
            lResult = lResult << nLoadBits;
            lResult |= nRemainderUnitData;
        }
    }
    this->m_nBitIndex = (this->m_nBitIndex + nLoadBits) % BinaryStream::ByteByBit;
    return lResult;
}

char BinaryStream::ReadSByte() {
    const char chByteUnitData = (*this->m_pchBopdy) & 0xff;
    long long llSinBit = Bit::Get(chByteUnitData, BinaryStream::ByteByBit);
    char chResult = 1 == llSinBit ? (~chByteUnitData + 1) * -1 : chByteUnitData & 0x7f;
    this->Seek(SeekOption::Move);
    return chResult;
}

short BinaryStream::ReadSShort(Endian eEndian) {
    short sResult = 0;
    for (int i = 0; i < BinaryStream::ShortByByte; i++) {
        const unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitShift = Endian::Big == eEndian ? i : BinaryStream::ShortByByte - (i + 1);
        sResult |= chByteUnitData << (nBitShift * BinaryStream::ByteByBit);
        if (i == BinaryStream::ShortByByte - 1) {
            long long llSinBit = Bit::Get(chByteUnitData, BinaryStream::ByteByBit);
            sResult = 1 == llSinBit ? (~sResult + 1) * -1 : sResult;
            break;
        }
        this->Seek(SeekOption::Move);
    }
    return sResult;
}

int BinaryStream::ReadSInt(Endian eEndian) {
    int nResult = 0;
    for (int i = 0; i < BinaryStream::IntByByte; i++) {
        const unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitShift = Endian::Big == eEndian ? i : BinaryStream::IntByByte - (i + 1);
        nResult |= chByteUnitData << (nBitShift * BinaryStream::ByteByBit);
        if (i == BinaryStream::IntByByte - 1) {
            long long llSinBit = Bit::Get(chByteUnitData, BinaryStream::ByteByBit);
            nResult = 1 == llSinBit ? (~nResult + 1) * -1 : nResult;
            break;
        }
        this->Seek(SeekOption::Move);
    }
    return nResult;
}

unsigned char BinaryStream::ReadUByte() {
    const unsigned char chResult = (*this->m_pchBopdy) & 0xff;
    this->Seek(SeekOption::Move);
    return chResult;
}

unsigned short BinaryStream::ReadUShort(Endian eEndian) {
    unsigned short sResult = 0;
    for (int i = 0; i < BinaryStream::ShortByByte; i++) {
        const unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitShift = Endian::Big == eEndian ? i : BinaryStream::ShortByByte - (i + 1);
        sResult |= chByteUnitData << (nBitShift * BinaryStream::ByteByBit);
        this->Seek(SeekOption::Move);
    }
    return sResult;
}

unsigned int BinaryStream::ReadUInt(Endian eEndian) {
    unsigned int nResult = 0;
    for (int i = 0; i < BinaryStream::IntByByte; i++) {
        const unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitShift = Endian::Big == eEndian ? i : BinaryStream::IntByByte - (i + 1);
        nResult |= chByteUnitData << (nBitShift * BinaryStream::ByteByBit);
        this->Seek(SeekOption::Move);
    }
    return nResult;
}

float BinaryStream::ReadFloat(Endian eEndian) {
    const int nFractionDataBitNum = 23;
    const int nFractionExponentDataBitNum = 31;
    const int nFractionDataSize = 0xffffff;
    const int nFractionImplicitData = 0x800000;
    const int nExponentDataSize = 0xff;
    const int nExponentBiasDataSize = 0x7f;
    const int nSinBitMask = 0x80000000;
    unsigned int nData = 0;
    float fResult = 0.0f;
    for (int i = 0; i < BinaryStream::FloatByByte; i++) {
        const unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitShift = Endian::Big == eEndian ? i : BinaryStream::FloatByByte - (i + 1);
        nData |= chByteUnitData << (nBitShift * BinaryStream::ByteByBit);
        if (i == BinaryStream::FloatByByte - 1) {
            unsigned int nFractionData = nData & nFractionDataSize;
            nFractionData = nFractionData | nFractionImplicitData;
            unsigned int nExponentData = (nData >> nFractionDataBitNum) & nExponentDataSize;
            unsigned int nSinBitData = (nData & nSinBitMask) >> nFractionExponentDataBitNum;
            float fFractionBase = 1.0f;
            float fFraction = 0.0f;
            for (int i = nFractionDataBitNum; i > 0; i--) {
                int nBit = (nFractionData >> i) & 0x01;
                if (i < nFractionDataBitNum) {
                    fFractionBase = fFractionBase / 2;
                }
                if (1 == nBit) {
                    fFraction += fFractionBase;
                }
            }
            int nOriginalExponentData = nExponentData - nExponentBiasDataSize;
            float fExponent = pow(2, nOriginalExponentData);
            float fAbsoluteResult = fExponent * fFraction;
            fResult = 1 == nSinBitData ? fAbsoluteResult * -1.0 : fAbsoluteResult;
            break;
        }
        this->Seek(SeekOption::Move);
    }
    return fResult;
}

double BinaryStream::ReadDouble(Endian eEndian) {
    const int nFractionDataBitNum = 52;
    const int nFractionExponentDataBitNum = 63;
    const long lFractionDataSize = 0xFFFFFFFFFFFFF;
    const long lFractionImplicitData = 0x10000000000000;
    const int nExponentDataSize = 0x7ff;
    const int nExponentBiasDataSize = 0x3FF;
    const long lSinBitMask = 0x8000000000000000;
    unsigned long long llData = 0;
    double dResult = 0.0L;
    for (int i = 0; i < BinaryStream::DoubleByByte; i++) {
        const unsigned long long llByteUnitData = (*this->m_pchBopdy) & 0xff;
        int nBitShift = Endian::Big == eEndian ? i : BinaryStream::DoubleByByte - (i + 1);
        llData |= llByteUnitData << (nBitShift * BinaryStream::ByteByBit);
        if (i == BinaryStream::DoubleByByte - 1) {
            unsigned long lFractionData = llData & lFractionDataSize;
            lFractionData = lFractionData | lFractionImplicitData;
            unsigned long lExponentData = (llData >> nFractionDataBitNum) & nExponentDataSize;
            unsigned long lSinBitData = (llData & lSinBitMask) >> nFractionExponentDataBitNum;
            double dFractionBase = 1.0L;
            double dFraction = 0.0L;
            for (int i = nFractionDataBitNum; i > 0; i--) {
                int nBit = (lFractionData >> i) & 0x01;
                if (i < nFractionDataBitNum) {
                    dFractionBase = dFractionBase / 2;
                }
                if (1 == nBit) {
                    dFraction += dFractionBase;
                }
            }
            long nOriginalExponentData = lExponentData - nExponentBiasDataSize;
            double dExponent = pow(2, nOriginalExponentData);
            double dAbsoluteResult = dExponent * dFraction;
            dResult = 1 == lSinBitData ? dAbsoluteResult * -1.0L : dAbsoluteResult;
            break;
        }
        this->Seek(SeekOption::Move);
    }
    return dResult;
}

long BinaryStream::GetFileSize(FILE *pFile) {
    fseek(pFile, 0, SEEK_END);
    const long lSize = ftell(pFile);
    rewind(pFile);
    return lSize;
}

int BinaryStream::GetBitIndex() {
    return this->m_nBitIndex;
}

void BinaryStream::Seek(SeekOption eSeekOption) {
    if (SeekOption::Start == eSeekOption) {
        this->m_pchBopdy -= this->m_lCurrentSeek * sizeof(char);
        this->m_lCurrentSeek = 0;
    } else if (SeekOption::Move == eSeekOption) {
        this->m_pchBopdy += sizeof(char);
        this->m_lCurrentSeek++;
    }
}
