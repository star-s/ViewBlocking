import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ViewBlockingTests.allTests),
    ]
}
#endif
