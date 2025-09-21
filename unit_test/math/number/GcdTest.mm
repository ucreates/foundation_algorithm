#include "Gcd.hpp"
#import <XCTest/XCTest.h>
@interface GcdTest : XCTestCase

@end

@implementation GcdTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testEuclid {
    long long llGcd = Gcd::Euclid(12, 16);
    XCTAssertEqual(llGcd, 4);
    llGcd = Gcd::Euclid(36, 48);
    XCTAssertEqual(llGcd, 12);
}

@end
