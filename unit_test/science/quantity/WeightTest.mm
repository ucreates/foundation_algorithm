#include "Weight.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface WeightTest : XCTestCase

@end

@implementation WeightTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcOnEarth {
    Weight *pWeight = new Weight();
    float fWeight = pWeight->CalcOnEarth(100.0f);
    XCTAssertEqual(1.0f, fWeight);
    SAFE_DELETE(pWeight);
}

- (void)testCalcOnMoon {
    Weight *pWeight = new Weight();
    float fWeight = pWeight->CalcOnMoon(100.0f);
    XCTAssertEqual(0.16f, fWeight);
    SAFE_DELETE(pWeight);
}

@end
