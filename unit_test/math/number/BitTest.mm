#include "Bit.hpp"
#import <XCTest/XCTest.h>

@interface BitTest : XCTestCase

@end

@implementation BitTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testGet {
    long long llDigit = 0;
    for (int i = 1; i <= 64; i++) {
        llDigit = Bit::Get(0x01, i);
        int nThreshold = i == 1 ? 1 : 0;
        XCTAssertEqual(llDigit, nThreshold);
    }
    for (int i = 1; i <= 8; i++) {
        llDigit = Bit::Get(0xff, i);
        XCTAssertEqual(llDigit, 1);
    }
    for (int i = 1; i <= 16; i++) {
        llDigit = Bit::Get(0xffff, i);
        XCTAssertEqual(llDigit, 1);
    }
    for (int i = 1; i <= 24; i++) {
        llDigit = Bit::Get(0xffffff, i);
        XCTAssertEqual(llDigit, 1);
    }
    for (int i = 1; i <= 32; i++) {
        llDigit = Bit::Get(0xffffffff, i);
        XCTAssertEqual(llDigit, 1);
    }
}

- (void)testInvert {
    long long llResult = Bit::Invert(0x00, 1);
    XCTAssertEqual(llResult, 1);
    llResult = Bit::Invert(0x01, 1);
    XCTAssertEqual(llResult, 0);
    llResult = Bit::Invert(0x0f, 1);
    XCTAssertEqual(llResult, 0x0E);
    llResult = Bit::Invert(0xf0, 8);
    XCTAssertEqual(llResult, 0x70);
}

@end
