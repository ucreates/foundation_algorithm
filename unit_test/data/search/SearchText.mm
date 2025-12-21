#include "Macro.hpp"
#include "Search.hpp"
#import <XCTest/XCTest.h>

@interface SearchText : XCTestCase

@end

@implementation SearchText

- (void)setUp {
}

- (void)tearDown {
}

- (void)testBinary {
    Search *pSearch = new Search();
    for (int i = 0; i <= 10; i++) {
        pSearch->Append(i);
    }
    for (int i = 0; i <= 10; i++) {
        XCTAssertEqual(i, pSearch->Binary(i));
    }
    SAFE_DELETE(pSearch);
}

@end
