#include "BinaryStream.hpp"
#include "Macro.hpp"
#include <stdio.h>
#include <stdlib.h>
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

unsigned char BinaryStream::ReadBit(int nBit) {
    unsigned char chByteUnitData = (*this->m_pchBopdy) & 0xff;
    unsigned char chResult = chByteUnitData >> (nBit);
    chResult &= 0x01;
    this->m_pchBopdy += sizeof(char);
    this->m_lCurrentSeek++;
    return chResult;
}

long BinaryStream::GetFileSize(FILE *pFile) {
    fseek(pFile, 0, SEEK_END);
    long lSize = ftell(pFile);
    rewind(pFile);
    return lSize;
}

void BinaryStream::Seek(SeekOption eSeekOption) {
    if (SeekOption::Start == eSeekOption) {
        this->m_pchBopdy -= this->m_lCurrentSeek * sizeof(char);
        this->m_lCurrentSeek = 0;
    }
}
