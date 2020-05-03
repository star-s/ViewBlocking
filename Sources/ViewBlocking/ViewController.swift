//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 22/11/2019.
//

#if canImport(UIKit)
import UIKit

extension UIViewController {
    
    open func stopEditsWhile(_ progress: Progress, animated: Bool = true) {
        setEditing(false, animated: animated)
        setObservedProgress(progress) { [weak self] in
            self?.setEditing(true, animated: animated)
        }
    }
}

#endif
