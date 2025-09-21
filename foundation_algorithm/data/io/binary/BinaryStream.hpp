#ifndef BinaryStream_hpp
#define BinaryStream_hpp
#include "SeekOption.hpp"
#include <stdio.h>
class BinaryStream {
private:
    unsigned char *m_pchBopdy;
    long m_lSize;
    long m_lCurrentSeek;

public:
    static const int ByteByBit;
    BinaryStream();
    ~BinaryStream();
    bool Read(const char *pchFilePath);
    unsigned char ReadBit(const int nBits);
    char ReadSByte();
    unsigned char ReadUByte();
    long GetFileSize(FILE *pFile);
    void Seek(SeekOption eSeekOption);
};
#endif /* BinaryStream_hpp */
