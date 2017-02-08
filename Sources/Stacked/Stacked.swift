import Foundation

/// Get the calling function's address and look it up, attempting to find the symbol.
/// NOTE: This is mostly useful in debug environements. Outside this, non-public functions and images without symbols will return incomplete information.
/// - parameter skipCount: the number of stack frames to skip over before analyzing
/// - returns: the `dladdr` identifier for the specified frame, if one exists
@inline(never)
public func callingFunctionIdentifier(skipCount: UInt = 0) -> String {
    let address = callStackReturnAddresses(skip: skipCount + 1, maximumAddresses: 1).first ?? 0
    return AddressInfo(address: address).symbol
}

/// When applied to the output of callStackReturnAddresses, produces identical output to the execinfo function "backtrace_symbols" or NSThread.callStackSymbols
/// - parameter addresses: an array of memory addresses, generally as produced by `callStackReturnAddresses`
/// - returns: an array of formatted, symbolicated stack frame descriptions.
public func symbolsForCallStack(addresses: [UInt]) -> [String] {
    return addresses.enumerated().map { (index: Int, address: UInt) -> String in
        return AddressInfo(address: address).formattedDescription(index: index)
    }
}

extension Thread {
    public static func getStackTrace(skip: UInt = 1) -> [String] {
        let addresses = Stacked.callStackReturnAddresses(skip: skip)
        return symbolsForCallStack(addresses: addresses)
    }
}
