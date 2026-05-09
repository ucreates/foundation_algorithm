#include "AtkinSieve.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface AtkinSieveTest : XCTestCase

@end

@implementation AtkinSieveTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSieve {
    AtkinSieve *pSieve = new AtkinSieve();
    std::vector<unsigned long long> vecResult = pSieve->Sieve(100);
    for (std::vector<unsigned long long>::iterator it = vecResult.begin(); it != vecResult.end();) {
        printf("素数:%lld\n", *it);
        ++it;
    }
    SAFE_DELETE(pSieve);
}

@end
