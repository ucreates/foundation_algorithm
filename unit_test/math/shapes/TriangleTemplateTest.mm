#include "TriangleTemplate.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface TriangleTemplateTest : XCTestCase

@end

@implementation TriangleTemplateTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcArea {
    TriangleTemplate<int> *pShape1 = new TriangleTemplate<int>(2, 3);
    XCTAssertEqual(3, pShape1->CalcArea());
    SAFE_DELETE(pShape1);
    TriangleTemplate<float> *pShape2 = new TriangleTemplate<float>(2.5f, 3.5f);
    XCTAssertEqual(4.375f, pShape2->CalcArea());
    SAFE_DELETE(pShape2);
}

- (void)testCalcScale {
    int nEdges[3]{4, 6, 8};
    TriangleTemplate<int> *pShape1 = new TriangleTemplate<int>(nEdges);
    int *pnEdges = pShape1->CalcScale(2, true);
    XCTAssertEqual(8, pnEdges[0]);
    XCTAssertEqual(12, pnEdges[1]);
    XCTAssertEqual(16, pnEdges[2]);
    SAFE_DELETE(pShape1);
    float fEdges[3]{4.4f, 6.6f, 8.8f};
    TriangleTemplate<float> *pShape2 = new TriangleTemplate<float>(fEdges);
    float *pfEdges = pShape2->CalcScale(2.0f, true);
    XCTAssertEqual(8.8f, pfEdges[0]);
    XCTAssertEqual(13.2f, pfEdges[1]);
    XCTAssertEqual(17.6f, pfEdges[2]);
    SAFE_DELETE(pShape2);
}

@end
