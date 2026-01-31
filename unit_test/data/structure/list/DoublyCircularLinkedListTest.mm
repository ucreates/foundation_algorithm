#include "DoublyCircularLinkedList.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface DoublyCircularLinkedListTest : XCTestCase

@end

@implementation DoublyCircularLinkedListTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testAppend {
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    DoublyCircularLinkedList *pList = new DoublyCircularLinkedList();
    pList->Append(chA);
    pList->Append(chB);
    pList->Append(chC);
    pList->Append(chD);
    XCTAssertEqual(pList->GetCount(), 4);
    pList->Write();
    SAFE_DELETE(pList);
}

@end
