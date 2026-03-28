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

- (void)testCalcScale {
    int nEdges[3]{4, 6, 8};
    TriangleConcrete *pShape = new TriangleConcrete(nEdges);
    int *pnEdges = pShape->CalcScale(2, true);
    XCTAssertEqual(8, pnEdges[0]);
    XCTAssertEqual(12, pnEdges[1]);
    XCTAssertEqual(16, pnEdges[2]);
    pnEdges = pShape->CalcScale(2, false);
    XCTAssertEqual(4, pnEdges[0]);
    XCTAssertEqual(6, pnEdges[1]);
    XCTAssertEqual(8, pnEdges[2]);
    SAFE_DELETE(pShape);
}

@end
