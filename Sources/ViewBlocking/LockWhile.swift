//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 14/11/2019.
//

#if canImport(UIKit)
import UIKit

public extension UIResponder {

    @objc
    func lockWhile(_ progress: Progress, options: LockingOptions = []) {
        if let next = next {
            next.lockWhile(progress, options: options)
        } else {
            UIApplication.shared.lockWhile(progress, options: options)
        }
    }
}

@objc
public protocol ProgressLockableApplicationDelegate: UIApplicationDelegate {
    @objc
    optional func application(_ application: UIApplication, lockWhile progress: Progress, options: LockingOptions)
}

public extension UIApplication {
    
    @objc
    override func lockWhile(_ progress: Progress, options: LockingOptions = []) {
        if let delegate = delegate as? ProgressLockableApplicationDelegate, let delegateMethod = delegate.application(_:lockWhile:options:) {
            delegateMethod(self, progress, options)
        }
    }
}

#endif
