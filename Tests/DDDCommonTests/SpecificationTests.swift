//
//  SpecificationTests.swift
//  
//
//  Created by Witt, Robert on 21.06.20.
//

import XCTest
@testable import DDDCommon

final class SpecificationTests: XCTestCase {
    
    static var allTests = [
        ("testIsSatisfied", testIsSatisfied)
    ]
    
    func testIsSatisfied() {
        let cut = UnderAgeSpecification()
        XCTAssertTrue(cut.isSatisfied(candidate: 15))
        XCTAssertFalse(cut.isSatisfied(candidate: 18))
        XCTAssertFalse(cut.isSatisfied(candidate: 42))
    }
    
}
