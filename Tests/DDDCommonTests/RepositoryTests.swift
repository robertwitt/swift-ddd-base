//
//  RepositoryTests.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import DDDCommon

@available(OSX 10.15, *)
final class RepositoryTests: XCTestCase {
    
    static var allTests = [
        ("testGetById", testGetById),
        ("testSave", testSave),
    ]
    
    func testGetById() {
        let repository = CustomerRepository()
        var entity = repository.get(byID: "4711")
        XCTAssertNotNil(entity)
        XCTAssertEqual(entity?.id, "4711")
        
        entity = repository.get(byID: "")
        XCTAssertNotNil(entity)
        XCTAssertEqual(entity?.id, "")
    }
    
    func testSave() {
        let repository = CustomerRepository()
        let customer = Customer(id: "4711")
        repository.save(customer)
        XCTAssert(repository.get(byID: "4711") === customer)
    }
    
}

