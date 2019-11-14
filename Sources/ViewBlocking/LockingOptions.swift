//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 04/11/2019.
//

import Foundation

@objc
public final class LockingOptions: NSObject, OptionSet {

    public var rawValue: Int

    public typealias RawValue = Int

    public override convenience init() {
        self.init(rawValue: 0)
    }

    public init(rawValue: Int) {
        self.rawValue = rawValue
        super.init()
    }
    
    public static let canCancel                 = LockingOptions(rawValue: 1 << 0)
    public static let canPause                  = LockingOptions(rawValue: 1 << 1)
    public static let showDescription           = LockingOptions(rawValue: 1 << 2)
    public static let showAdditionalDescription = LockingOptions(rawValue: 1 << 3)

    // MARK: NSObject

    public override var hash: Int {
        return rawValue
    }

    public override func isEqual(_ object: Any?) -> Bool {
        guard let that = object as? LockingOptions else {
            return false
        }
        return rawValue == that.rawValue
    }

    // MARK: OptionSet

    public func formUnion(_ other: LockingOptions) {
        rawValue = rawValue | other.rawValue
    }

    public func formIntersection(_ other: LockingOptions) {
        rawValue = rawValue & other.rawValue
    }

    public func formSymmetricDifference(_ other: LockingOptions) {
        rawValue = rawValue ^ other.rawValue
    }
}
