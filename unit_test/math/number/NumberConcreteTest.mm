#include "NumberConcrete.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface NumberConcreteTest : XCTestCase

@end

@implementation NumberConcreteTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSizeOfNumber {
    NumberConcrete *pNumber = new NumberConcrete();
    XCTAssertEqual(pNumber->SizeOfNumber(1, 10), 2);
    XCTAssertEqual(pNumber->SizeOfNumber(10, 1), 1);
    XCTAssertEqual(pNumber->SizeOfNumber(1, 1), 0);
    SAFE_DELETE(pNumber);
}

- (void)testPlus {
    NumberConcrete *pNumber1 = new NumberConcrete();
    XCTAssertEqual(pNumber1->Plus(1, 10), 11);
    SAFE_DELETE(pNumber1);
}

- (void)testMinus {
    NumberConcrete *pNumber1 = new NumberConcrete();
    XCTAssertEqual(pNumber1->Minus(1, 10), -9);
    SAFE_DELETE(pNumber1);
}

- (void)testMultiplication {
    NumberConcrete *pNumber1 = new NumberConcrete();
    XCTAssertEqual(pNumber1->Multiplication(1, 10), 10);
    SAFE_DELETE(pNumber1);
}

- (void)testDivision {
    NumberConcrete *pNumber1 = new NumberConcrete();
    XCTAssertEqual(pNumber1->Division(100, 10), 10);
    SAFE_DELETE(pNumber1);
}

@end
