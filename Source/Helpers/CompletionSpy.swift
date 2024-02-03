// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE.txt for licensing information

import Foundation

public class CompletionSpy<T> {

    public private(set) var invocations = [T]()

    public init() {}

    public func callAsFunction(_ arg: T) {
        invocations.append(arg)
    }
}

public extension CompletionSpy where T == Void {

    func callAsFunction() {
        invocations.append()
    }
}

public protocol CompletionSpyFactory {

    func makeVoidCompletionSpy() -> CompletionSpy<Void>
    func makeIntCompletionSpy() -> CompletionSpy<Int>
    func makeStringCompletionSpy() -> CompletionSpy<String>
    func makeBoolCompletionSpy() -> CompletionSpy<Bool>
    func makeDoubleCompletionSpy() -> CompletionSpy<Double>
    func makeErrorCompletionSpy() -> CompletionSpy<Error>
    func makeStringResultCompletionSpy() -> CompletionSpy<Result<String, Error>>
    func makeVoidResultCompletionSpy() -> CompletionSpy<Result<Void, Error>>
    func makeDataResultCompletionSpy() -> CompletionSpy<Result<Data, Error>>
    func makeCompletionSpy<T>(_ type: T.Type) -> CompletionSpy<T>

    static func makeVoidCompletionSpy() -> CompletionSpy<Void>
    static func makeIntCompletionSpy() -> CompletionSpy<Int>
    static func makeStringCompletionSpy() -> CompletionSpy<String>
    static func makeBoolCompletionSpy() -> CompletionSpy<Bool>
    static func makeDoubleCompletionSpy() -> CompletionSpy<Double>
    static func makeErrorCompletionSpy() -> CompletionSpy<Error>
    static func makeStringResultCompletionSpy() -> CompletionSpy<Result<String, Error>>
    static func makeVoidResultCompletionSpy() -> CompletionSpy<Result<Void, Error>>
    static func makeDataResultCompletionSpy() -> CompletionSpy<Result<Data, Error>>
    static func makeCompletionSpy<T>(_ type: T.Type) -> CompletionSpy<T>
}

public extension CompletionSpyFactory {

    func makeVoidCompletionSpy() -> CompletionSpy<Void> {
        Self.makeVoidCompletionSpy()
    }

    func makeIntCompletionSpy() -> CompletionSpy<Int> {
        Self.makeIntCompletionSpy()
    }

    func makeStringCompletionSpy() -> CompletionSpy<String> {
        Self.makeStringCompletionSpy()
    }

    func makeBoolCompletionSpy() -> CompletionSpy<Bool> {
        Self.makeBoolCompletionSpy()
    }

    func makeDoubleCompletionSpy() -> CompletionSpy<Double> {
        Self.makeDoubleCompletionSpy()
    }

    func makeErrorCompletionSpy() -> CompletionSpy<Error> {
        Self.makeErrorCompletionSpy()
    }

    func makeStringResultCompletionSpy() -> CompletionSpy<Result<String, Error>> {
        Self.makeStringResultCompletionSpy()
    }

    func makeVoidResultCompletionSpy() -> CompletionSpy<Result<Void, Error>> {
        Self.makeVoidResultCompletionSpy()
    }

    func makeDataResultCompletionSpy() -> CompletionSpy<Result<Data, Error>> {
        Self.makeDataResultCompletionSpy()
    }

    func makeCompletionSpy<T>(_ type: T.Type = T.self) -> CompletionSpy<T> {
        Self.makeCompletionSpy(type)
    }

    static func makeVoidCompletionSpy() -> CompletionSpy<Void> {
        makeCompletionSpy()
    }

    static func makeIntCompletionSpy() -> CompletionSpy<Int> {
        makeCompletionSpy()
    }

    static func makeStringCompletionSpy() -> CompletionSpy<String> {
        makeCompletionSpy()
    }

    static func makeBoolCompletionSpy() -> CompletionSpy<Bool> {
        makeCompletionSpy()
    }

    static func makeDoubleCompletionSpy() -> CompletionSpy<Double> {
        makeCompletionSpy()
    }

    static func makeErrorCompletionSpy() -> CompletionSpy<Error> {
        makeCompletionSpy()
    }

    static func makeStringResultCompletionSpy() -> CompletionSpy<Result<String, Error>> {
        makeCompletionSpy()
    }

    static func makeVoidResultCompletionSpy() -> CompletionSpy<Result<Void, Error>> {
        makeCompletionSpy()
    }

    static func makeDataResultCompletionSpy() -> CompletionSpy<Result<Data, Error>> {
        makeCompletionSpy()
    }

    static func makeCompletionSpy<T>(_ type: T.Type = T.self) -> CompletionSpy<T> {
        .init()
    }
}
