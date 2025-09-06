#include "ConvexLens.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface ConvexLensTest : XCTestCase

@end

@implementation ConvexLensTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcFocalDistance {
    ConvexLens *pLens = new ConvexLens();
    int nFocalDistance = pLens->CalcFocalDistance(20, 20);
    XCTAssertEqual(10, nFocalDistance);
    SAFE_DELETE(pLens);
}

@end
