#include "BinaryStream.hpp"
#include "Bit.hpp"
#include "Macro.hpp"
#include <stdio.h>
#include <stdlib.h>
const int BinaryStream::ByteByBit = 8;
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

unsigned char BinaryStream::ReadBit(const int nBit) {
    const unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
    unsigned char chResult = chByteUnitData >> (nBit - 1);
    chResult &= 0x01;
    this->m_pchBopdy += sizeof(char);
    this->m_lCurrentSeek++;
    return chResult;
}

char BinaryStream::ReadSByte() {
    const char chByteUnitData = (*this->m_pchBopdy) & 0xff;
    long long llSinBit = Bit::Get(chByteUnitData, BinaryStream::ByteByBit);
    char chResult = 1 == llSinBit ? (~chByteUnitData + 1) * -1 : chByteUnitData & 0x7f;
    this->m_pchBopdy += sizeof(char);
    this->m_lCurrentSeek++;
    return chResult;
}

unsigned char BinaryStream::ReadUByte() {
    const unsigned char chResult = (*this->m_pchBopdy) & 0xff;
    this->m_pchBopdy += sizeof(char);
    this->m_lCurrentSeek++;
    return chResult;
}

long BinaryStream::GetFileSize(FILE *pFile) {
    fseek(pFile, 0, SEEK_END);
    const long lSize = ftell(pFile);
    rewind(pFile);
    return lSize;
}

void BinaryStream::Seek(SeekOption eSeekOption) {
    if (SeekOption::Start == eSeekOption) {
        this->m_pchBopdy -= this->m_lCurrentSeek * sizeof(char);
        this->m_lCurrentSeek = 0;
    }
}
