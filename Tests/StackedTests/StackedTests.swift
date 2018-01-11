import XCTest
@testable import Stacked

class StackedTests: XCTestCase {
    static var allTests = [
        ("testExample", testExample)
    ]
    
    func anExample() throws -> [String] {
        return anotherExample()
    }
    
    func anotherExample() -> [String] {
        return FrameAddress.getStackTrace()
    }

    func testExample() {
        XCTAssert(true)
        let stacktrace = try! anExample()
        stacktrace.forEach {
            print($0)
        }
    }
}
