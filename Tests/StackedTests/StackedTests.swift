import XCTest
@testable import Stacked

class StackedTests: XCTestCase {
    static var allTests = [
        ("testExample", testExample)
    ]
    
    func testExample() {
        let stacktrace = FrameAddress.getStackTrace()
        stacktrace.forEach {
            print($0)
        }
    }
}
