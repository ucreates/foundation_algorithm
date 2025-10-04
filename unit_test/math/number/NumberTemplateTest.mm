#include "NumberTemplate.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>

@interface NumberTemplateTest : XCTestCase

@end

@implementation NumberTemplateTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testSizeOfNumber {
    NumberTemplate<int> *pNumber = new NumberTemplate<int>();
    XCTAssertEqual(pNumber->SizeOfNumber(1, 10), 2);
    XCTAssertEqual(pNumber->SizeOfNumber(10, 1), 1);
    XCTAssertEqual(pNumber->SizeOfNumber(1, 1), 0);
    SAFE_DELETE(pNumber);
}

- (void)testPlus {
    NumberTemplate<int> *pNumber1 = new NumberTemplate<int>();
    XCTAssertEqual(pNumber1->Plus(1, 10), 11);
    SAFE_DELETE(pNumber1);
    NumberTemplate<long> *pNumber2 = new NumberTemplate<long>();
    XCTAssertEqual(pNumber2->Plus(1, 10), 11);
    SAFE_DELETE(pNumber2);
    NumberTemplate<float> *pNumber3 = new NumberTemplate<float>();
    XCTAssertEqual(pNumber3->Plus(1.1f, 10.0f), 11.1f);
    SAFE_DELETE(pNumber3);
    NumberTemplate<double> *pNumber4 = new NumberTemplate<double>();
    XCTAssertEqual(pNumber4->Plus(1.1, 10.0), 11.1);
    SAFE_DELETE(pNumber4);
}

- (void)testMinus {
    NumberTemplate<int> *pNumber1 = new NumberTemplate<int>();
    XCTAssertEqual(pNumber1->Minus(1, 10), -9);
    SAFE_DELETE(pNumber1);
    NumberTemplate<long> *pNumber2 = new NumberTemplate<long>();
    XCTAssertEqual(pNumber2->Minus(1, 10), -9);
    SAFE_DELETE(pNumber2);
    NumberTemplate<float> *pNumber3 = new NumberTemplate<float>();
    XCTAssertEqual(pNumber3->Minus(1.1f, 10.0f), -8.9f);
    SAFE_DELETE(pNumber3);
    NumberTemplate<double> *pNumber4 = new NumberTemplate<double>();
    XCTAssertEqual(pNumber4->Minus(1.1, 10.0), -8.9);
    SAFE_DELETE(pNumber4);
}

- (void)testMultiplication {
    NumberTemplate<int> *pNumber1 = new NumberTemplate<int>();
    XCTAssertEqual(pNumber1->Multiplication(1, 10), 10);
    SAFE_DELETE(pNumber1);
    NumberTemplate<long> *pNumber2 = new NumberTemplate<long>();
    XCTAssertEqual(pNumber2->Multiplication(1, 10), 10);
    SAFE_DELETE(pNumber2);
    NumberTemplate<float> *pNumber3 = new NumberTemplate<float>();
    XCTAssertEqual(pNumber3->Multiplication(1.1f, 10.0f), 11.0f);
    SAFE_DELETE(pNumber3);
    NumberTemplate<double> *pNumber4 = new NumberTemplate<double>();
    XCTAssertEqual(pNumber4->Multiplication(1.1, 10.0), 11.0);
    SAFE_DELETE(pNumber4);
}

- (void)testDivision {
    NumberTemplate<int> *pNumber1 = new NumberTemplate<int>();
    XCTAssertEqual(pNumber1->Division(100, 10), 10);
    SAFE_DELETE(pNumber1);
    NumberTemplate<long> *pNumber2 = new NumberTemplate<long>();
    XCTAssertEqual(pNumber2->Division(100, 10), 10);
    SAFE_DELETE(pNumber2);
    NumberTemplate<float> *pNumber3 = new NumberTemplate<float>();
    XCTAssertEqual(pNumber3->Division(1.1f, 10.0f), 0.11f);
    SAFE_DELETE(pNumber3);
    NumberTemplate<double> *pNumber4 = new NumberTemplate<double>();
    XCTAssertEqual(pNumber4->Division(10.0, 2.0), 5.0);
    SAFE_DELETE(pNumber4);
}

- (void)testEvenOddJudgment {
    NumberTemplate<int> *pNumber1 = new NumberTemplate<int>();
    XCTAssertTrue(pNumber1->EvenOddJudgment(100));
    XCTAssertFalse(pNumber1->EvenOddJudgment(99));
    SAFE_DELETE(pNumber1);
    NumberTemplate<long> *pNumber2 = new NumberTemplate<long>();
    XCTAssertTrue(pNumber2->EvenOddJudgment(100L));
    XCTAssertFalse(pNumber2->EvenOddJudgment(99L));
    SAFE_DELETE(pNumber2);
    NumberTemplate<float> *pNumber3 = new NumberTemplate<float>();
    XCTAssertTrue(pNumber3->EvenOddJudgment(100.0f));
    XCTAssertFalse(pNumber3->EvenOddJudgment(99.0f));
    SAFE_DELETE(pNumber3);
    NumberTemplate<double> *pNumber4 = new NumberTemplate<double>();
    XCTAssertTrue(pNumber4->EvenOddJudgment(100.0));
    XCTAssertFalse(pNumber4->EvenOddJudgment(99.0));
    SAFE_DELETE(pNumber4);
}

@end
