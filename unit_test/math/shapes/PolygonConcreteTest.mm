//
//  PolygonConcreteTest.m
//  unit_test
//
//  Created by Kotaro Masamoto on 2025/11/10.
//

#include "PolygonConcrete.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface PolygonConcreteTest : XCTestCase

@end

@implementation PolygonConcreteTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSumOfInteriorAngles {
    PolygonConcrete *pPolygonConcrete = new PolygonConcrete(9);
    XCTAssertEqual(1260, pPolygonConcrete->SumOfInteriorAngles());
    SAFE_DELETE(pPolygonConcrete);
}

@end
