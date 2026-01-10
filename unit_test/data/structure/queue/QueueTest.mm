#include "Queue.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface QueueTest : XCTestCase

@end

@implementation QueueTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testEnqueue {
    Queue *pQueue = new Queue();
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    pQueue->Enqueue(chA);
    pQueue->Enqueue(chB);
    pQueue->Enqueue(chC);
    pQueue->Enqueue(chD);
    XCTAssertEqual(pQueue->GetCount(), 4);
    pQueue->Output();
    SAFE_DELETE(pQueue);
}

- (void)testDequeue {
    Queue *pQueue = new Queue();
    char chA[] = "A";
    char chB[] = "B";
    char chC[] = "C";
    char chD[] = "D";
    pQueue->Enqueue(chA);
    pQueue->Enqueue(chB);
    pQueue->Enqueue(chC);
    pQueue->Enqueue(chD);
    for (int i = 0; i < 4; i++) {
        pQueue->Dequeue();
    }
    XCTAssertEqual(pQueue->GetCount(), 0);
    pQueue->Output();
    SAFE_DELETE(pQueue);
}

@end
