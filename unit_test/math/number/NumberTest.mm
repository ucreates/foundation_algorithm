#include "Number.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface NumberTest : XCTestCase

@end

@implementation NumberTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSizeOfNumber {
    Number *number = new Number();
    number->SizeOfNumber(1, 10);
    number->SizeOfNumber(10, 1);
    number->SizeOfNumber(1, 1);
    SAFE_DELETE(number);
}

@end
