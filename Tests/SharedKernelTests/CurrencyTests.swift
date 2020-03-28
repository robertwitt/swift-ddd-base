//
//  CurrencyTests.swift
//  
//
//  Created by Witt, Robert on 28.03.20.
//

import XCTest
@testable import SharedKernel

final class CurrencyTests: XCTestCase {
    
    static var allTests = [
        ("testEquals", testEquals),
        ("testConstants", testConstants),
    ]
    
    func testEquals() {
        XCTAssertEqual(Currency(code: "EUR"), Currency(code: "EUR"))
        XCTAssertNotEqual(Currency(code: "EUR"), Currency(code: "USD"))
    }
    
    func testConstants() {
        XCTAssertEqual(Currency.EUR.code, "EUR")
        XCTAssertEqual(Currency.GBP.code, "GBP")
        XCTAssertEqual(Currency.USD.code, "USD")
    }
    
}
