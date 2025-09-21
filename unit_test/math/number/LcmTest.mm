#include "Lcm.hpp"
#import <XCTest/XCTest.h>

@interface LcmTest : XCTestCase

@end

@implementation LcmTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testEuclid {
    long long llLcm = Lcm::Euclid(12, 16);
    XCTAssertEqual(llLcm, 48);
    llLcm = Lcm::Euclid(36, 48);
    XCTAssertEqual(llLcm, 144);
}

@end
