import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(CurrencyTests.allTests),
        testCase(MoneyTests.allTests),
    ]
}
#endif
