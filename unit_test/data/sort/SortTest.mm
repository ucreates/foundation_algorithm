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

- (void)testSelectSortOrderAsc {
    Sort *pSort = new Sort();
    for (int i = 10; i >= 0; i--) {
        pSort->Append(i);
    }
    printf("選択ソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Select(SortOrder::Asc);
    printf("選択ソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), i);
    }
    SAFE_DELETE(pSort);
}

- (void)testSelectSortOrderDesc {
    Sort *pSort = new Sort();
    for (int i = 0; i <= 10; i++) {
        pSort->Append(i);
    }
    printf("選択ソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Select(SortOrder::Desc);
    printf("選択ソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), pSort->GetCount() - 1 - i);
    }
    SAFE_DELETE(pSort);
}

- (void)testInsertSortOrderAsc {
    Sort *pSort = new Sort();
    for (int i = 10; i >= 0; i--) {
        pSort->Append(i);
    }
    printf("挿入ソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Insert(SortOrder::Asc);
    printf("挿入ソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), i);
    }
    SAFE_DELETE(pSort);
}

- (void)testInsertSortOrderDesc {
    Sort *pSort = new Sort();
    for (int i = 0; i <= 10; i++) {
        pSort->Append(i);
    }
    printf("挿入ソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Insert(SortOrder::Desc);
    printf("挿入ソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), pSort->GetCount() - 1 - i);
    }
    SAFE_DELETE(pSort);
}

- (void)testHeapSortOrderAsc {
    Sort *pSort = new Sort();
    for (int i = 0; i <= 10; i++) {
        pSort->Append(i);
    }
    printf("ヒープソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Heap(SortOrder::Asc);
    printf("ヒープソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), i);
    }
    SAFE_DELETE(pSort);
}

- (void)testHeapSortOrderDesc {
    Sort *pSort = new Sort();
    for (int i = 0; i <= 10; i++) {
        pSort->Append(i);
    }
    printf("ヒープソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Heap(SortOrder::Desc);
    printf("ヒープソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), pSort->GetCount() - 1 - i);
    }
    SAFE_DELETE(pSort);
}

- (void)testQuickSortOrderAsc {
    Sort *pSort = new Sort();
    for (int i = 0; i <= 10; i++) {
        pSort->Append(i);
    }
    printf("クイックソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Quick(SortOrder::Asc);
    printf("クイックソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), i);
    }
    SAFE_DELETE(pSort);
}

- (void)testQuickSortOrderDesc {
    Sort *pSort = new Sort();
    for (int i = 0; i <= 10; i++) {
        pSort->Append(i);
    }
    printf("クイックソート前\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
    }
    pSort->Quick(SortOrder::Desc);
    printf("クイックソート後\n");
    for (int i = 0; i < pSort->GetCount(); i++) {
        printf("(%d)\n", pSort->Get(i));
        XCTAssertEqual(pSort->Get(i), pSort->GetCount() - 1 - i);
    }
    SAFE_DELETE(pSort);
}

@end
