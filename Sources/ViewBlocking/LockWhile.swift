//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 14/11/2019.
//

#if canImport(UIKit)
import UIKit

extension UIResponder {

    @objc
    open func lockWhile(_ progress: Progress, options: LockingOptions = []) {
        (next ?? UIApplication.shared).lockWhile(progress, options: options)
    }
}

@objc
public protocol ProgressLockableApplicationDelegate: UIApplicationDelegate {
    @objc
    optional func application(_ application: UIApplication, lockWhile progress: Progress, options: LockingOptions)
}

extension UIApplication {
    
    @objc
    override open func lockWhile(_ progress: Progress, options: LockingOptions = []) {
        (delegate as? ProgressLockableApplicationDelegate)?.application?(self, lockWhile: progress, options: options)
    }
}

#endif
