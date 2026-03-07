#include "BinarySearchTree.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface BinarySearchTreeTest : XCTestCase

@end

@implementation BinarySearchTreeTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testInsert {
    BinarySearchTree *pBinarySearchTree = new BinarySearchTree();
    pBinarySearchTree->Insert(60);
    pBinarySearchTree->Insert(40);
    pBinarySearchTree->Insert(20);
    pBinarySearchTree->Insert(10);
    pBinarySearchTree->Insert(30);
    pBinarySearchTree->Insert(50);
    pBinarySearchTree->Insert(80);
    pBinarySearchTree->Insert(70);
    pBinarySearchTree->Insert(90);
    pBinarySearchTree->InOrderTraversal();
    pBinarySearchTree->PreOrderTraversal();
    pBinarySearchTree->PostOrderTraversal();
    SAFE_DELETE(pBinarySearchTree);
}

- (void)testSearch {
    BinarySearchTree *pBinarySearchTree = new BinarySearchTree();
    pBinarySearchTree->Insert(60);
    pBinarySearchTree->Insert(40);
    pBinarySearchTree->Insert(20);
    pBinarySearchTree->Insert(10);
    pBinarySearchTree->Insert(30);
    pBinarySearchTree->Insert(50);
    pBinarySearchTree->Insert(80);
    pBinarySearchTree->Insert(70);
    pBinarySearchTree->Insert(90);
    Node *pNode = pBinarySearchTree->Search(SortOrder::Asc);
    printf("min::%d\n", pNode->nData);
    pNode = pBinarySearchTree->Search(SortOrder::Desc);
    printf("max::%d\n", pNode->nData);
    SAFE_DELETE(pBinarySearchTree);
}

- (void)testDelete {
    BinarySearchTree *pBinarySearchTree = new BinarySearchTree();
    pBinarySearchTree->Insert(60);
    pBinarySearchTree->Insert(40);
    pBinarySearchTree->Insert(20);
    pBinarySearchTree->Insert(10);
    pBinarySearchTree->Insert(30);
    pBinarySearchTree->Insert(50);
    pBinarySearchTree->Insert(80);
    pBinarySearchTree->Insert(70);
    pBinarySearchTree->Insert(90);
    XCTAssertEqual(9, pBinarySearchTree->GetCount());
    Node *pNode = pBinarySearchTree->Remove(10);
    XCTAssertEqual(8, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    pNode = pBinarySearchTree->Remove(20);
    XCTAssertEqual(7, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    pNode = pBinarySearchTree->Remove(30);
    XCTAssertEqual(6, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    pNode = pBinarySearchTree->Remove(40);
    XCTAssertEqual(5, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    pNode = pBinarySearchTree->Remove(50);
    XCTAssertEqual(4, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    pNode = pBinarySearchTree->Remove(70);
    XCTAssertEqual(3, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    pNode = pBinarySearchTree->Remove(80);
    XCTAssertEqual(2, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    pNode = pBinarySearchTree->Remove(90);
    XCTAssertEqual(1, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    // Root Nodeは削除不能
    pNode = pBinarySearchTree->Remove(60);
    XCTAssertEqual(1, pBinarySearchTree->GetCount());
    pBinarySearchTree->InOrderTraversal();
    SAFE_DELETE(pBinarySearchTree);
}

@end
