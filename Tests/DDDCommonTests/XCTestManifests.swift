import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(AggregateRootTests.allTests),
        testCase(DomainEventHandlerTests.allTests),
        testCase(EntityTests.allTests),
        testCase(RepositoryTests.allTests),
        testCase(SpecificationTests.allTests),
        testCase(ValueObjectTests.allTests),
    ]
}
#endif
