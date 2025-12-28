#include "MiddleSquareHashTable.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
const int CAPACITY = 16;

@interface MiddleSquareHashTableTest : XCTestCase

@end

@implementation MiddleSquareHashTableTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testPut {
    MiddleSquareHashTable *pHashTable = new MiddleSquareHashTable(CAPACITY);
    for (int i = 0; i < 5; i++) {
        NSString *keyString = [NSString stringWithFormat:@"%d", i];
        char *pchKeyCStr = strdup(keyString.UTF8String);
        pHashTable->Put(pchKeyCStr, const_cast<char *>("value"));
        free(pchKeyCStr);
        XCTAssertEqual(i + 1, pHashTable->GetCount());
    }
    SAFE_DELETE(pHashTable);
}

- (void)testGet {
    MiddleSquareHashTable *pHashTable = new MiddleSquareHashTable(CAPACITY);
    for (int i = 0; i < 5; i++) {
        NSString *keyString = [NSString stringWithFormat:@"%d", i];
        char *pchKeyCStr = strdup(keyString.UTF8String);
        NSString *valueString = [NSString stringWithFormat:@"value%d", i];
        char *pchValueCStr = strdup(valueString.UTF8String);
        pHashTable->Put(pchKeyCStr, pchValueCStr);
        char *vpchVlue = pHashTable->Get(pchKeyCStr);
        XCTAssertEqual(pchValueCStr, vpchVlue);
        free(pchKeyCStr);
        free(pchValueCStr);
    }
    SAFE_DELETE(pHashTable);
}

- (void)testHashCode {
    MiddleSquareHashTable *pHashTable = new MiddleSquareHashTable(CAPACITY);
    int nResult = pHashTable->GetHashCode(const_cast<char *>("a"));
    XCTAssertEqual(15, nResult);
    nResult = pHashTable->GetHashCode(const_cast<char *>("b"));
    XCTAssertEqual(9, nResult);
    nResult = pHashTable->GetHashCode(const_cast<char *>("c"));
    XCTAssertEqual(2, nResult);
    nResult = pHashTable->GetHashCode(const_cast<char *>("d"));
    XCTAssertEqual(12, nResult);
    nResult = pHashTable->GetHashCode(const_cast<char *>("e"));
    XCTAssertEqual(6, nResult);
}

@end
