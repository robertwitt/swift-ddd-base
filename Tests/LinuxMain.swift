import XCTest

import Common

var tests = [XCTestCaseEntry]()
tests += Common.allTests()
tests += SharedKernel.allTests()
XCTMain(tests)
