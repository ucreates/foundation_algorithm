#include "Recursive.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface RecursiveTest : XCTestCase

@end

@implementation RecursiveTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testExecute {
    Recursive *pRecursive = new Recursive();
    XCTAssertEqual(120, pRecursive->Execute(5));
    SAFE_DELETE(pRecursive);
}

@end
