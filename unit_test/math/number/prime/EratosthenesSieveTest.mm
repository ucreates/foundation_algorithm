#include "EratosthenesSieve.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface EratosthenesSieveTest : XCTestCase

@end

@implementation EratosthenesSieveTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSieve {
    EratosthenesSieve *pSieve = new EratosthenesSieve();
    std::vector<unsigned long long> vecResult = pSieve->Sieve(100);
    for (std::vector<unsigned long long>::iterator it = vecResult.begin(); it != vecResult.end();) {
        printf("素数:%lld\n", *it);
        ++it;
    }
    SAFE_DELETE(pSieve);
}

@end
