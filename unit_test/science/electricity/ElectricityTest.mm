#include "Electricity.hpp"
#include "Macro.hpp"
#import <XCTest/XCTest.h>
@interface ElectricityTest : XCTestCase

@end

@implementation ElectricityTest

- (void)setUp {
}

- (void)tearDown {
}

- (void)testCalcVoltage {
    Electricity *pElectricity = new Electricity();
    XCTAssertEqual(16, pElectricity->CalcVoltage(2, 8));
    SAFE_DELETE(pElectricity);
}

- (void)testCalcAmpere {
    Electricity *pElectricity = new Electricity();
    XCTAssertEqual(2, pElectricity->CalcAmpere(16, 8));
    SAFE_DELETE(pElectricity);
}

@end
