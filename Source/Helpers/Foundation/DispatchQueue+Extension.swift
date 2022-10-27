// Copyright © 2018-2022 Kaleyra S.p.a. All Rights Reserved.
// See LICENSE for licensing information

import Foundation

public extension DispatchQueue {

    private static let dispatchSpecificKeyPointer: UnsafeMutablePointer<Int8> = UnsafeMutablePointer<Int8>.allocate(capacity: 1)
    private static let identifierPointer: UnsafeMutablePointer<Int8> = UnsafeMutablePointer<Int8>.allocate(capacity: 1)

    private var dispatchSpecificKey: DispatchSpecificKey<UUID>? {
        get {
            objc_getAssociatedObject(self, Self.dispatchSpecificKeyPointer) as? DispatchSpecificKey<UUID>
        }
        set {
            objc_setAssociatedObject(self, Self.dispatchSpecificKeyPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private var dispatchSpecificIdentifier: UUID? {
        get {
            objc_getAssociatedObject(self, Self.identifierPointer) as? UUID
        }
        set {
            objc_setAssociatedObject(self, Self.identifierPointer, newValue, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        }
    }

    private func addIdentifierIfNeeded() {
        guard dispatchSpecificKey == nil, dispatchSpecificIdentifier == nil else { return }

        let uuid = UUID()
        let key = DispatchSpecificKey<UUID>()

        setSpecific(key: key, value: uuid)
        
        dispatchSpecificKey = key
        dispatchSpecificIdentifier = uuid
    }

    func isCurrent() -> Bool {
        addIdentifierIfNeeded()

        return DispatchQueue.getSpecific(key: dispatchSpecificKey!) == dispatchSpecificIdentifier!
    }
}
