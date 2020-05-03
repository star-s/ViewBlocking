//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 14/11/2019.
//

#if canImport(UIKit)
import UIKit

extension UIView {
    
    public func removeFromSuperviewAfterFinish(_ progress: Progress) {
        setObservedProgress(progress) { [weak self] in
            self?.removeFromSuperview()
        }
    }
    
    public func hideWhile(_ progress: Progress) {
        isHidden = true
        setObservedProgress(progress) { [weak self] in
            self?.isHidden = false
        }
    }
}

#endif
