import FrameAddress
import Foundation

#if os(Linux)
    import Glibc
#else
    import Darwin.C
#endif

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
            
            var components = String(cString: cString).components(separatedBy: " ")
            for (index, component) in components.enumerated() {
                if component.hasPrefix("_T") {
                    components[index] = _stdlib_demangleName(component)
                }
            }
            
            result.append(components.joined(separator: " "))
        }
        free(cStrings)
        return result
    }
}

@_silgen_name("swift_demangle")
public
func _stdlib_demangleImpl(
    mangledName: UnsafePointer<CChar>?,
    mangledNameLength: UInt,
    outputBuffer: UnsafeMutablePointer<CChar>?,
    outputBufferSize: UnsafeMutablePointer<UInt>?,
    flags: UInt32
    ) -> UnsafeMutablePointer<CChar>?

internal func _stdlib_demangleName(_ mangledName: String) -> String {
    return mangledName.utf8CString.withUnsafeBufferPointer {
        (mangledNameUTF8CStr) in
        
        let demangledNamePtr = _stdlib_demangleImpl(
            mangledName: mangledNameUTF8CStr.baseAddress,
            mangledNameLength: UInt(mangledNameUTF8CStr.count - 1),
            outputBuffer: nil,
            outputBufferSize: nil,
            flags: 0)
        
        if let demangledNamePtr = demangledNamePtr {
            let demangledName = String(cString: demangledNamePtr)
            free(demangledNamePtr)
            return demangledName
        }
        return mangledName
    }
}
