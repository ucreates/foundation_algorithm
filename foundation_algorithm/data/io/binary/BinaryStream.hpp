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
    BinaryStream();
    ~BinaryStream();
    bool Read(const char *pchFilePath);
    unsigned char ReadBit(int nBits);
    long GetFileSize(FILE *pFile);
    void Seek(SeekOption eSeekOption);
};
#endif /* BinaryStream_hpp */
