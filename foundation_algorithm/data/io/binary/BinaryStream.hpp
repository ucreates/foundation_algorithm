#ifndef BinaryStream_hpp
#define BinaryStream_hpp
#include "Endian.hpp"
#include "SeekOption.hpp"
#include <stdio.h>
class BinaryStream {
private:
    unsigned char *m_pchBopdy;
    unsigned char m_chLatestLoadedByteUnitData;
    long m_lSize;
    long m_lCurrentSeek;
    int m_nBitIndex;

public:
    static const int ByteByBit;
    static const int ShortByByte;
    static const int IntByByte;
    static const int FloatByByte;
    static const int DoubleByByte;
    BinaryStream();
    ~BinaryStream();
    bool Read(const char *pchFilePath);
    unsigned char ReadBitFigure(const int nBit);
    unsigned long ReadBit(const int nBits, const Endian eEndian = Endian::Big);
    unsigned long ReadBitInsideBoundary(const int nStartBitFigure, const int nEndBitFigure);
    unsigned long ReadBitOutsideBoundary(int nBits, const Endian eEndian = Endian::Big);
    char ReadSByte();
    short ReadSShort(Endian eEndian = Endian::Big);
    int ReadSInt(Endian eEndian = Endian::Big);
    unsigned char ReadUByte();
    unsigned short ReadUShort(Endian eEndian = Endian::Big);
    unsigned int ReadUInt(Endian eEndian = Endian::Big);
    float ReadFloat(Endian eEndian = Endian::Big);
    double ReadDouble(Endian eEndian = Endian::Big);
    bool *ReadBool(Endian eEndian = Endian::Big);
    long GetFileSize(FILE *pFile);
    int GetBitIndex();
    void Seek(SeekOption eSeekOption);
};
#endif /* BinaryStream_hpp */
