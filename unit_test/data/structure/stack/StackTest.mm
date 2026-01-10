#include "Stack.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface StackTest : XCTestCase

@end

@implementation StackTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testPush {
    Stack *pStack = new Stack();
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    pStack->Push(chA);
    pStack->Push(chB);
    pStack->Push(chC);
    pStack->Push(chD);
    XCTAssertEqual(pStack->GetCount(), 4);
    pStack->Output();
    SAFE_DELETE(pStack);
}

- (void)testPop {
    Stack *pStack = new Stack();
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    pStack->Push(chA);
    pStack->Push(chB);
    pStack->Push(chC);
    pStack->Push(chD);
    for (int i = 0; i < 4; i++) {
        pStack->Pop();
    }
    XCTAssertEqual(pStack->GetCount(), 0);
    pStack->Output();
    SAFE_DELETE(pStack);
}

@end
