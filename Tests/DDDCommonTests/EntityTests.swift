//
//  EntityTests.swift
//
//
//  Created by Witt, Robert on 27.03.20.
//

import XCTest
@testable import DDDCommon

@available(OSX 10.15, *)
final class EntityTests: XCTestCase {

    static var allTests = [
        ("testEntityId", testEntityId),
        ("testEntityAttributes", testEntityAttributes),
        ("testEquals", testEquals),
    ]
    
    func testEntityId() {
        let person = Person(id: "4711")
        XCTAssertEqual(person.id, "4711")
    }
    
    func testEntityAttributes() {
        var person = Person(id: "4711")
        person.name = "Tom"
        XCTAssertEqual(person.id, "4711")
        XCTAssertEqual(person.name, "Tom")
        XCTAssertEqual(person.sayHello(), "Hi, my name is Tom")
        
        person = Person(id: "4711")
        XCTAssertEqual(person.id, "4711")
        XCTAssertEqual(person.sayHello(), "Hi, my name is 4711")
    }
    
    func testEquals() {
        let person = Person(id: "4711")
        XCTAssertEqual(person, Person(id: "4711"))
        XCTAssertNotEqual(person, Person(id: "0815"))
    }
    
}
