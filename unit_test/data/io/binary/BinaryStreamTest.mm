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
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"1" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 0 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit2 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"2" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 1 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit4 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"4" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 2 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit8 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"8" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 3 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit15 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"15" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i < 4 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit16 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"16" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 4 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit32 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"32" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 5 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit64 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"64" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 6 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit128 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"128" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = i == 7 ? 1 : 0;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

- (void)testReadBit170 {
    NSBundle *bundle = [NSBundle bundleForClass:[self class]];
    NSString *filepath = [bundle pathForResource:@"170" ofType:@"bin"];
    BinaryStream *pStream = new BinaryStream();
    bool result = pStream->Read([filepath UTF8String]);
    XCTAssertTrue(result);
    for (int i = 0; i < 8; i++) {
        unsigned char chResult = pStream->ReadBit(i);
        unsigned char chThreshold = 0 == i % 2 ? 0 : 1;
        XCTAssertEqual(chResult, chThreshold);
        pStream->Seek(SeekOption::Start);
    }
    SAFE_DELETE(pStream);
    return;
}

@end
