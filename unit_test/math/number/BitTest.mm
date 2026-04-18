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

- (void)testGetFigure {
    int nResult = Bit::GetFigure(1);
    XCTAssertEqual(nResult, 1);
}

- (void)testSet {
    long long llDefaultZaikoResult = Bit::Set(1, 1);
    XCTAssertEqual(llDefaultZaikoResult, 0);
    llDefaultZaikoResult = Bit::Set(2, 2);
    XCTAssertEqual(llDefaultZaikoResult, 0);
    llDefaultZaikoResult = Bit::Set(3, 2);
    XCTAssertEqual(llDefaultZaikoResult, 1);
    llDefaultZaikoResult = Bit::Set(2, 1, BitValue::One);
    XCTAssertEqual(llDefaultZaikoResult, 3);
    llDefaultZaikoResult = Bit::Set(1, 2, BitValue::One);
    XCTAssertEqual(llDefaultZaikoResult, 3);
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

- (void)testReversePart {
    long long llResult = Bit::Reverse(0x00, 1);
    XCTAssertEqual(llResult, 1);
    llResult = Bit::Reverse(0x01, 2);
    XCTAssertEqual(llResult, 3);
    llResult = Bit::Reverse(0x0f, 5);
    XCTAssertEqual(llResult, 31);
    llResult = Bit::Reverse(0xf0, 9);
    XCTAssertEqual(llResult, 496);
}

- (void)testReverseAll {
    long long llResult = Bit::Reverse(0x00);
    XCTAssertEqual(llResult, -1);
    llResult = Bit::Reverse(0x01);
    XCTAssertEqual(llResult, -2);
    llResult = Bit::Reverse(0x0f);
    XCTAssertEqual(llResult, -16);
    llResult = Bit::Reverse(0xff);
    XCTAssertEqual(llResult, -256);
}

- (void)testMultiplication {
    long long llResult = Bit::CalcMultiplication(0x01, 1);
    XCTAssertEqual(llResult, 2);
    llResult = Bit::CalcMultiplication(0x01, 2);
    XCTAssertEqual(llResult, 4);
    llResult = Bit::CalcMultiplication(0x01, 3);
    XCTAssertEqual(llResult, 8);
    llResult = Bit::CalcMultiplication(0x01, 4);
    XCTAssertEqual(llResult, 16);
}

- (void)testDivision {
    long long llResult = Bit::CalcDivision(0xff, 1);
    XCTAssertEqual(llResult, 127);
    llResult = Bit::CalcDivision(0xff, 2);
    XCTAssertEqual(llResult, 63);
    llResult = Bit::CalcDivision(0xff, 3);
    XCTAssertEqual(llResult, 31);
    llResult = Bit::CalcDivision(0xff, 4);
    XCTAssertEqual(llResult, 15);
}

- (void)testModulo {
    long long llResult = Bit::CalcModulo(0, 2);
    XCTAssertEqual(llResult, 0);
    llResult = Bit::CalcModulo(1, 2);
    XCTAssertEqual(llResult, 1);
    llResult = Bit::CalcModulo(2, 2);
    XCTAssertEqual(llResult, 2);
    llResult = Bit::CalcModulo(3, 2);
    XCTAssertEqual(llResult, 3);
    llResult = Bit::CalcModulo(4, 2);
    XCTAssertEqual(llResult, 0);
    llResult = Bit::CalcModulo(5, 2);
    XCTAssertEqual(llResult, 1);
    llResult = Bit::CalcModulo(6, 2);
    XCTAssertEqual(llResult, 2);
    llResult = Bit::CalcModulo(7, 2);
    XCTAssertEqual(llResult, 3);
}

- (void)testCreateMask {
    long long llResult = Bit::CreateMask(1);
    XCTAssertEqual(llResult, 1);
    llResult = Bit::CreateMask(4);
    XCTAssertEqual(llResult, 15);
    llResult = Bit::CreateMask(8);
    XCTAssertEqual(llResult, 255);
    llResult = Bit::CreateMask(16);
    XCTAssertEqual(llResult, 65535);
}

@end
