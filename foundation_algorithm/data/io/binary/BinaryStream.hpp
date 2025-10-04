#ifndef BinaryStream_hpp
#define BinaryStream_hpp
#include "Endian.hpp"
#include "SeekOption.hpp"
#include <stdio.h>
class BinaryStream {
private:
    unsigned char *m_pchBopdy;
    long m_lSize;
    long m_lCurrentSeek;

public:
    static const int ByteByBit;
    static const int ShortByByte;
    BinaryStream();
    ~BinaryStream();
    bool Read(const char *pchFilePath);
    unsigned char ReadBit(const int nBits);
    char ReadSByte();
    short ReadSShort(Endian eEndian = Endian::Big);
    unsigned char ReadUByte();
    unsigned short ReadUShort(Endian eEndian = Endian::Big);
    long GetFileSize(FILE *pFile);
    void Seek(SeekOption eSeekOption);
};
#endif /* BinaryStream_hpp */
