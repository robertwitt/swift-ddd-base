//
//  RepositoryTests.swift
//  
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import Common

final class RepositoryTests: XCTestCase {

    private class Customer: AggregateRoot {}
    
    private class SampleRepository: Repository {
        typealias T = Customer
        private var entities = ["": Customer(id: "")]
        
        func get(byId id: EntityId) -> Customer? {
            return entities[id] ?? Customer(id: id)
        }
        
        func save(_ rootEntity: Customer) {
            entities[rootEntity.id] = rootEntity
        }
    }
    
    static var allTests = [
        ("testGetById", testGetById),
        ("testSave", testSave),
    ]
    
    func testGetById() {
        let repository = SampleRepository()
        var entity = repository.get(byId: "4711")
        XCTAssertNotNil(entity)
        XCTAssertEqual(entity?.id, "4711")
        
        entity = repository.get(byId: "")
        XCTAssertNotNil(entity)
        XCTAssertEqual(entity?.id, "")
    }
    
    func testSave() {
        let repository = SampleRepository()
        let customer = Customer(id: "4711")
        repository.save(customer)
        XCTAssert(repository.get(byId: "4711") === customer)
    }
    
}

