#include "TriangleConcrete.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface TriangleConcreteTest : XCTestCase

@end

@implementation TriangleConcreteTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcArea {
    TriangleConcrete *pShape = new TriangleConcrete(2, 3);
    XCTAssertEqual(3, pShape->CalcArea());
    SAFE_DELETE(pShape);
}
@end
