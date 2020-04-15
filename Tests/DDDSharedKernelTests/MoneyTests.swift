//
//  MoneyTests.swift
//  
//
//  Created by Witt, Robert on 29.03.20.
//

import XCTest
@testable import DDDSharedKernel

final class MoneyTests: XCTestCase {
    
    static var allTests = [
        ("testEquals", testEquals),
        ("testLowerThan", testLowerThan),
        ("testLowerThanOrEqual", testLowerThanOrEqual),
        ("testGreaterThan", testGreaterThan),
        ("testGreaterThanOrEqual", testGreaterThanOrEqual),
        ("testAddition", testAddition),
        ("testSubtraction", testSubtraction),
        ("testMultiplication", testMultiplication),
        ("testCanAllocate", testCanAllocate),
        ("testAllocate", testAllocate),
    ]
    
    func testEquals() {
        XCTAssertEqual(Money(9.99, currency: .EUR), Money(9.99, currency: .EUR))
        XCTAssertNotEqual(Money(9.99, currency: .EUR), Money(15.99, currency: .EUR))
        XCTAssertNotEqual(Money(9.99, currency: .EUR), Money(9.99, currency: .GBP))
    }
    
    func testLowerThan() {
        let money1 = Money(9.99, currency: .EUR)
        let money2 = Money(15.99, currency: .EUR)
        XCTAssertLessThan(money1, money2)
        XCTAssertTrue(money1 < money2)
        XCTAssertFalse(money2 < money1)
        XCTAssertFalse(money1 < money1)
        XCTAssertFalse(money1 < Money(9.99, currency: .GBP))
    }
    
    func testLowerThanOrEqual() {
        let money1 = Money(9.99, currency: .EUR)
        let money2 = Money(15.99, currency: .EUR)
        XCTAssertLessThanOrEqual(money1, money2)
        XCTAssertTrue(money1 <= money2)
        XCTAssertFalse(money2 <= money1)
        XCTAssertTrue(money1 <= money1)
        XCTAssertFalse(money1 <= Money(9.99, currency: .GBP))
    }
    
    func testGreaterThan() {
        let money1 = Money(15.99, currency: .EUR)
        let money2 = Money(9.99, currency: .EUR)
        XCTAssertGreaterThan(money1, money2)
        XCTAssertTrue(money1 > money2)
        XCTAssertFalse(money2 > money1)
        XCTAssertFalse(money1 > money1)
        XCTAssertFalse(money1 > Money(15.99, currency: .GBP))
    }
    
    func testGreaterThanOrEqual() {
        let money1 = Money(15.99, currency: .EUR)
        let money2 = Money(9.99, currency: .EUR)
        XCTAssertGreaterThanOrEqual(money1, money2)
        XCTAssertTrue(money1 >= money2)
        XCTAssertFalse(money2 >= money1)
        XCTAssertTrue(money1 >= money1)
        XCTAssertFalse(money1 >= Money(15.99, currency: .GBP))
    }
    
    func testAddition() {
        let money = try! Money(9.99, currency: .EUR) + Money(15.99, currency: .EUR)
        XCTAssertEqual(money.amount, 25.98)
        XCTAssertEqual(money.currency, Currency.EUR)
        XCTAssertThrowsError(try Money(9.99, currency: .EUR) + Money(15.99, currency: .GBP))
    }
    
    func testSubtraction() {
        let money = try! Money(15.99, currency: .EUR) - Money(9.99, currency: .EUR)
        XCTAssertEqual(money.amount, 6.0)
        XCTAssertEqual(money.currency, Currency.EUR)
        XCTAssertThrowsError(try Money(15.99, currency: .EUR) - Money(9.99, currency: .GBP))
    }
    
    func testMultiplication() {
        let money = Money(9.99, currency: .EUR) * 3
        XCTAssertEqual(money.amount, 29.97)
        XCTAssertEqual(money.currency, Currency.EUR)
    }
    
    func testCanAllocate() {
        let money = Money(9.99, currency: .EUR)
        XCTAssertTrue(money.canAllocate(amount: 5.99))
        XCTAssertTrue(money.canAllocate(amount: 9.99))
        XCTAssertFalse(money.canAllocate(amount: 15.99))
    }
    
    func testAllocate() {
        let money = Money(9.99, currency: .EUR)
        XCTAssertEqual(try! money.allocate(amount: 5.99), Money(5.99, currency: .EUR))
        XCTAssertThrowsError(try money.allocate(amount: 15.99))
    }
    
}
