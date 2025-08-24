#import "Basic.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface BasicTest : XCTestCase

@end

@implementation BasicTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSequential {
    Basic *basic = new Basic();
    basic->Sequential();
    SAFE_DELETE(basic);
}

- (void)testBranch {
    Basic *basic = new Basic();
    basic->Branch(1);
    basic->Branch(2);
    basic->Branch(3);
    SAFE_DELETE(basic);
}

- (void)testRepeat {
    Basic *basic = new Basic();
    basic->Repeat(1);
    basic->Repeat(10);
    basic->Repeat(100);
    SAFE_DELETE(basic);
}

@end
