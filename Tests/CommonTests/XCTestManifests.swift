import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DomainEntityTests.allTests),
        testCase(DomainEventHandlerTests.allTests),
        testCase(DomainRepositoryTests.allTests),
        testCase(DomainRootEntityTests.allTests),
        testCase(DomainValueObjectTests.allTests),
    ]
}
#endif
