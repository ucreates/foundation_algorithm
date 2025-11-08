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
@end
