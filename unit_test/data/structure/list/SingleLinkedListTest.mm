#include "SingleLinkedList.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface SingleLinkedListTest : XCTestCase

@end

@implementation SingleLinkedListTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testAppend {
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    SingleLinkedList *pList = new SingleLinkedList();
    pList->Append(chA);
    pList->Append(chB);
    pList->Append(chC);
    pList->Append(chD);
    XCTAssertEqual(pList->GetCount(), 4);
    pList->Write();
    SAFE_DELETE(pList);
}

- (void)testInsert {
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    SingleLinkedList *pList = new SingleLinkedList();
    pList->Append(chA);
    pList->Append(chB);
    printf("insert失敗後\n");
    pList->Insert(10, chC);
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 2);
    printf("insert失敗後\n");
    pList->Insert(0, chC);
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 2);
    printf("insert後\n");
    pList->Insert(1, chC);
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 3);
    printf("insert後\n");
    pList->Insert(2, chD);
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 4);
    SAFE_DELETE(pList);
}

- (void)testDelete {
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    SingleLinkedList *pList = new SingleLinkedList();
    pList->Append(chA);
    pList->Append(chB);
    pList->Append(chC);
    pList->Append(chD);
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 4);
    pList->Delete(0);
    printf("削除後\n");
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 3);
    pList->Delete(5);
    printf("削除失敗後\n");
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 3);
    pList->Delete(1);
    printf("削除後\n");
    pList->Write();
    XCTAssertEqual(pList->GetCount(), 2);
    SAFE_DELETE(pList);
}
@end
