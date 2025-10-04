#include "Quality.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface QualityTest : XCTestCase

@end

@implementation QualityTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcOnEarth {
    Quality *pQuality = new Quality();
    float fQuality = pQuality->CalcOnEarth(100.0f);
    XCTAssertEqual(10000.0f, fQuality);
    SAFE_DELETE(pQuality);
}

- (void)testCalcOnMoon {
    Quality *pQuality = new Quality();
    float fQuality = pQuality->CalcOnMoon(100.0f);
    XCTAssertEqual(62500.0f, fQuality);
    SAFE_DELETE(pQuality);
}

@end
