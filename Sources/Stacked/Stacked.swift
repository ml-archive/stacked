import FrameAddress

#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif


public struct FrameAddress {
    public static func getStackTrace() -> [String] {
        var count: Int32 = 0
        guard let cStrings = get_stack_trace(32, &count) else {
            return []
        }
        
        var result: [String] = []
        
        for i in 0..<Int(count) {
            guard let cString = cStrings[i] else {
                break
            }
            
            result.append(String(cString: cString))
        }
        free(cStrings)
        return result
    }
}
