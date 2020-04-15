import XCTest

import DDDCommon
import DDDSharedKernel

var tests = [XCTestCaseEntry]()
tests += Common.allTests()
tests += SharedKernel.allTests()
XCTMain(tests)
