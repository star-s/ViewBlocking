//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 14/11/2019.
//

#if canImport(UIKit)
import UIKit

public extension UIRefreshControl {
    
    func endRefreshingAfterFinish(_ progress: Progress) {
        setObservedProgress(progress) { [weak self] in
            self?.endRefreshing()
        }
    }
}

#endif
