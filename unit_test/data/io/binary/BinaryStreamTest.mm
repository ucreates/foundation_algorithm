#include "BinaryStream.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface BinaryStreamTest : XCTestCase

@end

@implementation BinaryStreamTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testReadBitFigure1 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"1" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 1 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure2 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"2" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 2 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure4 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"4" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 3 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure8 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"8" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 4 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure15 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"15" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i < 5 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure16 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"16" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 5 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure32 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"32" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 6 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure64 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"64" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 7 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure128 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"128" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = i == 8 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitFigure170 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"170" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBitFigure(i);
        unsigned char chThreshold = 0 != i % 2 ? 0 : 1;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitInsideBoundaryOnStartBitIndex4 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadBit(4);
    XCTAssertEqual(15, lResult);
    XCTAssertEqual(4, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitOutsideBoundaryOnStartBitIndex9 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"256" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadBit(9);
    XCTAssertEqual(256, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitOutsideBoundaryOnStartBitIndex17 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"256" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadBit(17);
    XCTAssertEqual(256, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitInsideBoundaryOnMiddleBitIndex255 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadBit(1);
    XCTAssertEqual(1, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    lResult = pStream->ReadBit(4);
    XCTAssertEqual(15, lResult);
    XCTAssertEqual(5, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitInsideBoundaryOnMiddleBitIndex256 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"256" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadBit(1);
    XCTAssertEqual(0, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    lResult = pStream->ReadBit(8);
    XCTAssertEqual(128, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitInsideBoundaryOnMiddleBitIndex43690 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"43690" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = 0;
    // read 1~3bit:1010101010101010→010
    for (int i = 0; i < 16; i++) {
        unsigned long lResult = pStream->ReadBit(1);
        int value = i % 2 == 0 ? 0 : 1;
        XCTAssertEqual(value, lResult);
        XCTAssertEqual((i + 1) % BinaryStream::ByteByBit, pStream->GetBitIndex());
    }
    SAFE_DELETE(pStream);
    pStream = new BinaryStream();
    bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    // read 1~3bit:1010101010101010→010
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(3, pStream->GetBitIndex());
    // read 4~6bit:1010101010101010→101
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(5, lResult);
    XCTAssertEqual(6, pStream->GetBitIndex());
    // read 7~9bit:1010101010101010→010
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    // read 10~12bit:1010101010101010→101
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(5, lResult);
    XCTAssertEqual(4, pStream->GetBitIndex());
    // read 13~15bit:1010101010101010→010
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(7, pStream->GetBitIndex());
    // read 16bit:1010101010101010→1
    lResult = pStream->ReadBit(1);
    XCTAssertEqual(1, lResult);
    XCTAssertEqual(0, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBitInsideBoundaryOnMiddleBitIndex11184810 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"11184810" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(3, pStream->GetBitIndex());
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(5, lResult);
    XCTAssertEqual(6, pStream->GetBitIndex());
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(5, lResult);
    XCTAssertEqual(4, pStream->GetBitIndex());
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(7, pStream->GetBitIndex());
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(5, lResult);
    XCTAssertEqual(2, pStream->GetBitIndex());
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(5, pStream->GetBitIndex());
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(5, lResult);
    XCTAssertEqual(0, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    pStream = new BinaryStream();
    bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    lResult = pStream->ReadBit(3);
    XCTAssertEqual(2, lResult);
    XCTAssertEqual(3, pStream->GetBitIndex());
    lResult = pStream->ReadBit(13);
    XCTAssertEqual(5461, lResult);
    XCTAssertEqual(0, pStream->GetBitIndex());
    return;
}

- (void)testReadBitInsideBoundaryOnMiddleBitIndex174933 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"174933" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    // データ:101010101101010101
    // 1~9bit:101010101
    // bitIndex:0(初回によりスタートインデックスは0)
    // データ1:bitIndex0~8のうち8bit取得(01010101)
    // データ2:bitIndex0~8のうち1bit取得(1)
    // ビッグエンディアンにより並び順は昇順:101010101
    // bitIndex:1
    unsigned long lResult = pStream->ReadBit(9);
    XCTAssertEqual(341, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    // データ:101010101101010101
    // 10~18bit:101010101
    // bitIndex:1(初回の9bit/Readによりスタートインデックスは1)
    // データ1:bitIndex1~8のうち7bit取得(1010101)
    // データ2:bitIndex0~8のうち2bit取得(10)
    // ビッグエンディアンにより並び順は昇順(101010101)
    // bitIndex:2
    lResult = pStream->ReadBit(9);
    XCTAssertEqual(341, lResult);
    XCTAssertEqual(2, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    pStream = new BinaryStream();
    bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    // データ:101010101101010101
    // 1~9bit:101010101
    // bitIndex:0(初回によりスタートインデックスは0)
    // データ1:bitIndex0~8のうち8bit取得(01010101)
    // データ2:bitIndex0~8のうち1bit取得(1)
    // リトルエンディアンにより並び順は降順:010101011
    // bitIndex:1
    lResult = pStream->ReadBit(9, Endian::Little);
    XCTAssertEqual(171, lResult);
    XCTAssertEqual(1, pStream->GetBitIndex());
    // データ:101010101101010101
    // 10~18bit:101010101
    // bitIndex:1(初回の9bit/Readによりスタートインデックスは1)
    // データ1:bitIndex1~8のうち7bit取得(1010101)
    // データ2:bitIndex0~8のうち2bit取得(10)
    // リトルエンディアンにより並び順は降順(101010110)
    // bitIndex:2
    lResult = pStream->ReadBit(9, Endian::Little);
    XCTAssertEqual(342, lResult);
    XCTAssertEqual(2, pStream->GetBitIndex());
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte0 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"0" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, 0);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte127 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"127" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, 127);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte128 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"128" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -128);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte129 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"129" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -127);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte156 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"156" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -100);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte219 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"219" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -37);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte255 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -1);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte0 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"0" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 0);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte127 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"127" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 127);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte128 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"128" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 128);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte129 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"129" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 129);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte156 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"156" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 156);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte219 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"219" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 219);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte255 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 255);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSShort255 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    short cResult = pStream->ReadSShort();
    XCTAssertEqual(cResult, 255);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadSShort(Endian::Little);
    XCTAssertEqual(cResult, -256);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSShort43690 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"43690" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    short cResult = pStream->ReadSShort();
    XCTAssertEqual(cResult, -21846);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadSShort(Endian::Little);
    XCTAssertEqual(cResult, -21846);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSShort32768 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"32768" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    short cResult = pStream->ReadSShort();
    XCTAssertEqual(cResult, -32768);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadSShort(Endian::Little);
    XCTAssertEqual(cResult, 128);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSShort65280 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"65280" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    short cResult = pStream->ReadSShort();
    XCTAssertEqual(cResult, -256);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadSShort(Endian::Little);
    XCTAssertEqual(cResult, 255);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUShort255 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned short cResult = pStream->ReadUShort();
    XCTAssertEqual(cResult, 255);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadUShort(Endian::Little);
    XCTAssertEqual(cResult, 65280);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUShort3840 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"3840" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned short cResult = pStream->ReadUShort();
    XCTAssertEqual(cResult, 3840);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadUShort(Endian::Little);
    XCTAssertEqual(cResult, 15);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUShort43690 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"43690" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned short cResult = pStream->ReadUShort();
    XCTAssertEqual(cResult, 43690);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadUShort(Endian::Little);
    XCTAssertEqual(cResult, 43690);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUShort43707 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"43707" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned short cResult = pStream->ReadUShort();
    XCTAssertEqual(cResult, 43707);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadUShort(Endian::Little);
    XCTAssertEqual(cResult, 48042);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUShort61183 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"61183" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned short cResult = pStream->ReadUShort();
    XCTAssertEqual(cResult, 61183);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadUShort(Endian::Little);
    XCTAssertEqual(cResult, 65518);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUShort65280 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"65280" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned short cResult = pStream->ReadUShort();
    XCTAssertEqual(cResult, 65280);
    pStream->Seek(SeekOption::Start);
    cResult = pStream->ReadUShort(Endian::Little);
    XCTAssertEqual(cResult, 255);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSInt2147483648 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"2147483648" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    int nResult = pStream->ReadSInt();
    XCTAssertEqual(nResult, -2147483648);
    pStream->Seek(SeekOption::Start);
    nResult = pStream->ReadSInt(Endian::Little);
    XCTAssertEqual(nResult, 128);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSInt4292967296 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"4292967296" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    int nResult = pStream->ReadSInt();
    XCTAssertEqual(nResult, -2000000);
    pStream->Seek(SeekOption::Start);
    nResult = pStream->ReadSInt(Endian::Little);
    XCTAssertEqual(nResult, -2139364865);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSInt4294967295 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"4294967295" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    int nResult = pStream->ReadSInt();
    XCTAssertEqual(nResult, -1);
    pStream->Seek(SeekOption::Start);
    nResult = pStream->ReadSInt(Endian::Little);
    XCTAssertEqual(nResult, -1);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUInt2147483648 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"2147483648" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadUInt();
    XCTAssertEqual(lResult, 2147483648);
    pStream->Seek(SeekOption::Start);
    lResult = pStream->ReadUInt(Endian::Little);
    XCTAssertEqual(lResult, 128);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUInt4292967296 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"4292967296" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadUInt();
    XCTAssertEqual(lResult, 4292967296);
    pStream->Seek(SeekOption::Start);
    lResult = pStream->ReadUInt(Endian::Little);
    XCTAssertEqual(lResult, 2155602431);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUInt4294967295 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"4294967295" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    unsigned long lResult = pStream->ReadUInt();
    XCTAssertEqual(lResult, 4294967295);
    pStream->Seek(SeekOption::Start);
    lResult = pStream->ReadUInt(Endian::Little);
    XCTAssertEqual(lResult, 4294967295);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadFloat1103626240 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"1103626240" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    float fResult = pStream->ReadFloat();
    XCTAssertEqual(fResult, 25.0f);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadFloat3242721280 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"3242721280" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    float fResult = pStream->ReadFloat();
    XCTAssertEqual(fResult, -12.5f);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadFloat3240361984 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"3240361984" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    float fResult = pStream->ReadFloat();
    XCTAssertEqual(fResult, -10.25f);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadFloat1150964261 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"1150964261" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    float fResult = pStream->ReadFloat();
    XCTAssertEqual(fResult, 1234.566895f);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadFloat16840 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"16840" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    float fResult = pStream->ReadFloat(Endian::Little);
    XCTAssertEqual(fResult, 25.0f);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadFloat18625 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"18625" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    float fResult = pStream->ReadFloat(Endian::Little);
    XCTAssertEqual(fResult, -12.5f);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadDouble13904980329019473920 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"13904980329019473920" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    double fResult = pStream->ReadDouble();
    XCTAssertEqual(fResult, -99999.0L);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadDouble13845331891932102656 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"13845331891932102656" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    double fResult = pStream->ReadDouble();
    XCTAssertEqual(fResult, -10.25L);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBoolFigure170 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"170" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    bool *bResults = pStream->ReadBool();
    int nArraySize = sizeof(&bResults) / sizeof(bool);
    for (int i = 0; i < nArraySize; i++) {
        XCTAssertEqual(bResults[i], (0 == i % 2 ? false : true));
    }
    bResult = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(bResult);
    *bResults = pStream->ReadBool(Endian::Little);
    nArraySize = sizeof(&bResults) / sizeof(bool);
    for (int i = 0; i < nArraySize; i++) {
        XCTAssertEqual(bResults[i], (0 == i % 2 ? true : false));
    }
    SAFE_DELETE(pStream);
    return;
}

@end
