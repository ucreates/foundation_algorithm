#include "Macro.hpp"
#include "Pressure.hpp"
#import <XCTest/XCTest.h>

@interface PreasureTest : XCTestCase

@end

@implementation PreasureTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalc {
    Pressure *pPressure = new Pressure();
    float fResult = pPressure->Calc(10.0f, 2.0f);
    XCTAssertEqual(0.2f, fResult);
    SAFE_DELETE(pPressure);
}
@end
