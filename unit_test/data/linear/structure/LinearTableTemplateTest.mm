#include "LinearTableTemplate.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface LinearTableTemplateTest : XCTestCase

@end

@implementation LinearTableTemplateTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testNew {
    LinearTableTemplate<int> *linearTable = new LinearTableTemplate<int>();
    XCTAssertEqual(linearTable->GetCount(), 0);
    delete linearTable;
}

- (void)testAppend {
    const int max = 10;
    LinearTableTemplate<int> *linearTable = new LinearTableTemplate<int>();
    XCTAssertEqual(linearTable->GetCount(), 0);
    NSLog(@"Append前");
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, linearTable->Get(i));
    }
    NSLog(@"Append後");
    for (int i = 0; i < max; i++) {
        linearTable->Append(i);
        XCTAssertEqual(linearTable->GetCount(), i + 1);
        XCTAssertEqual(linearTable->Get(i), i);
    }
    XCTAssertEqual(linearTable->GetCount(), 10);
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, linearTable->Get(i));
    }
    SAFE_DELETE(linearTable);
}

- (void)testInsert {
    const int max = 10;
    const int index = 5;
    LinearTableTemplate<int> *linearTable = new LinearTableTemplate<int>();
    XCTAssertEqual(linearTable->GetCount(), 0);
    for (int i = 0; i < max; i++) {
        linearTable->Append(i);
    }
    XCTAssertEqual(linearTable->GetCount(), 10);
    NSLog(@"Insert前");
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, linearTable->Get(i));
    }
    linearTable->Insert(index, 100);
    XCTAssertEqual(linearTable->GetCount(), 11);
    NSLog(@"Insert後");
    for (int i = 0; i < max + 1; i++) {
        NSLog(@"i=%d,value=%d", i, linearTable->Get(i));
    }
    for (int i = 0; i < max + 1; i++) {
        if (i < index) {
            XCTAssertEqual(linearTable->Get(i), i);
        } else if (i == index) {
            XCTAssertEqual(linearTable->Get(i), 100);
        } else {
            XCTAssertEqual(linearTable->Get(i), i - 1);
        }
    }
    SAFE_DELETE(linearTable);
}

- (void)testRemove {
    const int max = 10;
    LinearTableTemplate<int> *linearTable = new LinearTableTemplate<int>();
    XCTAssertEqual(linearTable->GetCount(), 0);
    for (int i = 0; i < max; i++) {
        linearTable->Append(i);
    }
    XCTAssertEqual(linearTable->GetCount(), 10);
    NSLog(@"Remove前");
    for (int i = 0; i < max; i++) {
        NSLog(@"i=%d,value=%d", i, linearTable->Get(i));
    }
    for (int i = 0; i < max; i++) {
        linearTable->Remove(0);
        NSLog(@"Remove後");
        NSLog(@"max - i - 1=%d,GetLength=%d", max - i - 1, linearTable->GetCount());
        XCTAssertEqual(linearTable->GetCount(), max - i - 1);
        if (0 == linearTable->GetCount()) {
            NSLog(@"empty");
            break;
        } else {
            for (int j = 0; j < (max - i - 1); j++) {
                NSLog(@"j=%d,value=%d", j, linearTable->Get(j));
                NSLog(@"i + 1=%d,value(GetFirst)=%d", i + 1, linearTable->GetFirst());
                XCTAssertEqual(linearTable->GetFirst(), i + 1);
                NSLog(@"max=%d,value(GetLast)=%d", max, linearTable->GetLast());
                XCTAssertEqual(linearTable->GetLast(), max - 1);
            }
        }
    }
    SAFE_DELETE(linearTable);
}

@end
