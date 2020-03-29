//
//  AggregateRootTests.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import Common

@available(OSX 10.15, *)
final class AggregateRootTests: XCTestCase {
    
    static var allTests = [
        ("testAddDomainEvent", testAddDomainEvent)
    ]
    
    func testAddDomainEvent() {
        let customer = Customer(id: "4711")
        XCTAssert(customer.domainEvents.count == 0)
        
        customer.addDomainEvent(CustomerEvent())
        customer.addDomainEvent(CustomerEvent())
        customer.addDomainEvent(CustomerEvent())
        XCTAssert(customer.domainEvents.count == 3)
        
        customer.clearDomainEvents()
        XCTAssert(customer.domainEvents.count == 0)
    }
    
}
