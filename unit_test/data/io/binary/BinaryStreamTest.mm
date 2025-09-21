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

- (void)testReadBit1 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"1" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 1 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit2 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"2" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 2 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit4 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"4" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 3 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit8 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"8" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 4 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit15 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"15" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i < 5 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit16 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"16" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 5 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit32 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"32" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 6 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit64 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"64" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 7 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit128 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"128" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 8 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit170 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"170" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 1; i <= 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = 0 != i % 2 ? 0 : 1;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte0 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"0" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, 0);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte127 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"127" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, 127);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte128 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"128" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -128);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte129 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"129" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -127);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte156 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"156" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -100);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte219 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"219" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -37);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadSByte255 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    char cResult = pStream->ReadSByte();
    XCTAssertEqual(cResult, -1);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte0 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"0" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 0);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte127 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"127" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 127);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte128 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"128" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 128);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte129 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"129" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 129);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte156 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"156" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 156);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte219 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"219" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 219);
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadUByte255 {
    NSBundle *pBundle = [NSBundle bundleForClass:[self class]];
    NSString *pFilepath = [pBundle pathForResource:@"255" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([pFilepath UTF8String]);
    XCTAssertTrue(result);
    unsigned char cResult = pStream->ReadUByte();
    XCTAssertEqual(cResult, 255);
    SAFE_DELETE(pStream);
    return;
}

@end
