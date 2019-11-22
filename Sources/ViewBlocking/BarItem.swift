//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 22/11/2019.
//

#if canImport(UIKit)
import UIKit

public extension UIBarItem {
    
    func disableWhile(_ progress: Progress) {
        isEnabled = false
        setObservedProgress(progress) { [weak self] in
            self?.isEnabled = true
        }
    }
}

#endif
