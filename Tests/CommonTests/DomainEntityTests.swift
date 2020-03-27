//
//  DomainEntityTests.swift
//
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import Common

final class DomainEntityTests: XCTestCase {
    
    private class Customer: DomainEntity {
        var name: String?
        
        func sayHello() -> String {
            return "Hi, my name is \(name ?? id)"
        }
    }

    static var allTests = [
        ("testEntityId", testEntityId),
        ("testEntityAttributes", testEntityAttributes),
        ("testEquals", testEquals),
    ]
    
    func testEntityId() {
        let customer = Customer(id: "4711")
        XCTAssertEqual(customer.id, "4711")
    }
    
    func testEntityAttributes() {
        var customer = Customer(id: "4711")
        customer.name = "Tom"
        XCTAssertEqual(customer.id, "4711")
        XCTAssertEqual(customer.name, "Tom")
        XCTAssertEqual(customer.sayHello(), "Hi, my name is Tom")
        
        customer = Customer(id: "4711")
        XCTAssertEqual(customer.id, "4711")
        XCTAssertEqual(customer.sayHello(), "Hi, my name is 4711")
    }
    
    func testEquals() {
        let customer = Customer(id: "4711")
        XCTAssertEqual(customer, Customer(id: "4711"))
        XCTAssertNotEqual(customer, Customer(id: "0815"))
    }
    
}
