#include "Figure.hpp"
#import <XCTest/XCTest.h>
@interface FigureTest : XCTestCase

@end

@implementation FigureTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCount {
    XCTAssertEqual(1, Figure<int>::Count(1));
    XCTAssertEqual(2, Figure<int>::Count(12));
    XCTAssertEqual(3, Figure<int>::Count(123));
    XCTAssertEqual(4, Figure<int>::Count(1234));
    XCTAssertEqual(5, Figure<int>::Count(12345));
    XCTAssertEqual(6, Figure<int>::Count(123456));
    XCTAssertEqual(7, Figure<int>::Count(1234567));
    XCTAssertEqual(8, Figure<int>::Count(12345678));
    XCTAssertEqual(9, Figure<int>::Count(123456789));
}

- (void)testGetSpeciFigureValue {
    for (int i = 1; i <= 9; i++) {
        XCTAssertEqual(10 - i, Figure<int>::GetFigure(123456789, i));
    }
}
@end
