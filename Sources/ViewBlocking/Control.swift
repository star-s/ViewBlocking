//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 14/11/2019.
//

#if canImport(UIKit)
import UIKit

public extension UIControl {
    
    func disableWhile(_ progress: Progress) {
        isEnabled = false
        setObservedProgress(progress) { [weak self] in
            self?.isEnabled = true
        }
    }
}

#endif
