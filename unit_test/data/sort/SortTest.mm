#include "Sort.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface SortTest : XCTestCase

@end

@implementation SortTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testBubbleSortOrderAsc {
    Sort *pSort = new Sort();
    for (int i = 10; i >= 0; i--) {
        pSort->Append(i);
    }
    printf("バブルソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Bubble(SortOrder::Asc);
    printf("バブルソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), i);
    }
    SAFE_DELETE(pSort);
}

- (void)testBubbleSortOrderDesc {
    Sort *pSort = new Sort();
    for (int i = 0; i <= 10; i++) {
        pSort->Append(i);
    }
    printf("バブルソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Bubble(SortOrder::Desc);
    printf("バブルソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), pSort->GetCount() - 1 - i);
    }
    SAFE_DELETE(pSort);
}

@end
