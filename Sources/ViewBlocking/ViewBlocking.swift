//
//  File.swift
//
//
//  Created by Sergey Starukhin on 04/11/2019.
//

import Foundation
import ObjectiveC

private var ProgressObserversKey: Void?

extension NSObject {
    
    func setObservedProgress(_ progress: Progress, completionWork: @escaping @convention(block) () -> Void) {
        if progress.isFinished || progress.isCancelled {
            DispatchQueue.main.async(execute: completionWork)
        } else {
            let observer = ProgressObserver()
            observer.progress = progress
            observer.completionWork = completionWork
            let storage = progressObserversStorage
            storage.add(observer)
            observer.storage = storage
        }
    }
    
    var progressObserversStorage: NSMutableSet {
        if let set = objc_getAssociatedObject(self, &ProgressObserversKey) as? NSMutableSet {
            return set
        }
        objc_setAssociatedObject(self, &ProgressObserversKey, NSMutableSet(), .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
        return self.progressObserversStorage
    }
}
