//
//  AggregateRootTests.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import Common

final class AggregateRootTests: XCTestCase {
    
    private class CustomerEvent: DomainEvent {}
    
    private class Customer: AggregateRoot {}
    
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
