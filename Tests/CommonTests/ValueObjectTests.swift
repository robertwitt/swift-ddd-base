//
//  ValueObjectTests.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import Common

final class ValueObjectTests: XCTestCase {
    
    private struct Currency: ValueObject {
        let code: String
    
        func hash(into hasher: inout Hasher) {
            hasher.combine(code)
        }
        
        static func == (lhs: Currency, rhs: Currency) -> Bool {
            return lhs.code == rhs.code
        }
    }
    
    static var allTests = [
        ("testEquals", testEquals),
    ]
    
    func testEquals() {
        let euro = Currency(code: "EUR")
        let dollar = Currency(code: "USD")
        XCTAssertNotEqual(euro, dollar)
        XCTAssertEqual(euro, Currency(code: "EUR"))
    }
    
}
