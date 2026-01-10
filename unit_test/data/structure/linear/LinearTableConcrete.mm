#include "LinearTableConcrete.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface LinearTableConcreteTest : XCTestCase

@end

@implementation LinearTableConcreteTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testNew {
    LinearTableConcrete *pLinearTable = new LinearTableConcrete();
    XCTAssertEqual(pLinearTable->GetCount(), 0);
    delete pLinearTable;
}

- (void)testAppend {
    const int max = 10;
    LinearTableConcrete *pLinearTable = new LinearTableConcrete();
    XCTAssertEqual(pLinearTable->GetCount(), 0);
    NSLog(@"Append前");
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, pLinearTable->Get(i));
    }
    NSLog(@"Append後");
    for (int i = 0; i < max; i++) {
        pLinearTable->Append(i);
        XCTAssertEqual(pLinearTable->GetCount(), i + 1);
        XCTAssertEqual(pLinearTable->Get(i), i);
    }
    XCTAssertEqual(pLinearTable->GetCount(), 10);
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, pLinearTable->Get(i));
    }
    SAFE_DELETE(pLinearTable);
}

- (void)testInsert {
    const int max = 10;
    const int index = 5;
    LinearTableConcrete *pLinearTable = new LinearTableConcrete();
    XCTAssertEqual(pLinearTable->GetCount(), 0);
    for (int i = 0; i < max; i++) {
        pLinearTable->Append(i);
    }
    XCTAssertEqual(pLinearTable->GetCount(), 10);
    NSLog(@"Insert前");
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, pLinearTable->Get(i));
    }
    pLinearTable->Insert(index, 100);
    XCTAssertEqual(pLinearTable->GetCount(), 11);
    NSLog(@"Insert後");
    for (int i = 0; i < max + 1; i++) {
        NSLog(@"i=%d,value=%d", i, pLinearTable->Get(i));
    }
    for (int i = 0; i < max + 1; i++) {
        if (i < index) {
            XCTAssertEqual(pLinearTable->Get(i), i);
        } else if (i == index) {
            XCTAssertEqual(pLinearTable->Get(i), 100);
        } else {
            XCTAssertEqual(pLinearTable->Get(i), i - 1);
        }
    }
    SAFE_DELETE(pLinearTable);
}

- (void)testRemove {
    const int max = 10;
    LinearTableConcrete *pLinearTable = new LinearTableConcrete();
    XCTAssertEqual(pLinearTable->GetCount(), 0);
    for (int i = 0; i < max; i++) {
        pLinearTable->Append(i);
    }
    XCTAssertEqual(pLinearTable->GetCount(), 10);
    NSLog(@"Remove前");
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, pLinearTable->Get(i));
    }
    for (int i = 0; i < max; i++) {
        pLinearTable->Remove(0);
        NSLog(@"Remove後");
        NSLog(@"max - i - 1=%d,GetLength=%d", max - i - 1, pLinearTable->GetCount());
        XCTAssertEqual(pLinearTable->GetCount(), max - i - 1);
        if (0 == pLinearTable->GetCount()) {
            NSLog(@"empty");
            break;
        } else {
            for (int j = 0; j < (max - i - 1); j++) {
                NSLog(@"j=%d,value=%d", j, pLinearTable->Get(j));
                NSLog(@"i + 1=%d,value(GetFirst)=%d", i + 1, pLinearTable->GetFirst());
                XCTAssertEqual(pLinearTable->GetFirst(), i + 1);
                NSLog(@"max=%d,value(GetLast)=%d", max, pLinearTable->GetLast());
                XCTAssertEqual(pLinearTable->GetLast(), max - 1);
            }
        }
    }
    SAFE_DELETE(pLinearTable);
}

@end
