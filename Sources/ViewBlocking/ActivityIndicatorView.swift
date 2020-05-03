//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 14/11/2019.
//

#if canImport(UIKit)
import UIKit

extension UIActivityIndicatorView {
    
    public func animatingWhile(_ progress: Progress) {
        startAnimating()
        setObservedProgress(progress) { [weak self] in
            self?.stopAnimating()
        }
    }
}

#endif
