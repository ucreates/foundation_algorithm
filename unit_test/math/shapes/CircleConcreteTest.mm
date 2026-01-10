#include "CircleConcrete.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface CircleConcreteTest : XCTestCase

@end

@implementation CircleConcreteTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcCircumference {
    CircleConcrete *pCircleConcrete = new CircleConcrete(10);
    XCTAssertEqual(31.415926f, pCircleConcrete->CalcCircumference());
    SAFE_DELETE(pCircleConcrete);
}

- (void)testCalcArea {
    CircleConcrete *pCircleConcrete = new CircleConcrete(10);
    XCTAssertEqual(78.539818f, pCircleConcrete->CalcArea());
    SAFE_DELETE(pCircleConcrete);
}

- (void)testCalcRadius {
    CircleConcrete *pCircleConcrete = new CircleConcrete(10);
    XCTAssertEqual(5.0f, pCircleConcrete->CalcRadius());
    SAFE_DELETE(pCircleConcrete);
}

@end
