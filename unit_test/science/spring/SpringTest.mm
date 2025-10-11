#include "Spring.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface SpringTest : XCTestCase

@end

@implementation SpringTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcPower {
    Spring *pSpring = new Spring();
    float fResult = pSpring->CalcPower(200.0f, 10.0f);
    XCTAssertEqual(0.05f, fResult);
    SAFE_DELETE(pSpring);
}
- (void)testCalcSpringExtension {
    Spring *pSpring = new Spring();
    float fResult = pSpring->CalcSpringExtension(200.0f, 0.05f);
    XCTAssertEqual(10.0f, fResult);
    SAFE_DELETE(pSpring);
}
@end
