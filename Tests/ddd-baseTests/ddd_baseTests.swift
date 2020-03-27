import XCTest
@testable import ddd_base

final class ddd_baseTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(ddd_base().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
