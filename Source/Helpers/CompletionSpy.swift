// Copyright © 2020 Bandyer S.r.l. All rights reserved.
// See LICENSE.txt for licensing information

import Foundation

public class CompletionSpy<T> {
    
    public enum State<T> {
        case notCalled
        case called(withArgument: T)
    }
    
    public private(set) var state: State<T> = .notCalled
    public private(set) var invocations = [T]()

    public init() {}

    public var called: Bool {
        switch state {
            case .notCalled:
                return false
            default:
                return true
        }
    }
    
    public func callable(_ arg: T) -> Void {
        state = .called(withArgument: arg)
        invocations.append(arg)
    }
}

public extension CompletionSpy where T == Void {
    
    func callable() -> Void {
        state = .called
        invocations.append(())
    }
}

extension CompletionSpy.State: Equatable where T:Equatable {}

public extension CompletionSpy.State where T == Void {
    
    static var called: CompletionSpy<T>.State<T> {
        CompletionSpy<T>.State<T>.called(withArgument: ())
    }
}
