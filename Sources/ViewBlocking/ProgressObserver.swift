//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 04/11/2019.
//

import Foundation

final class ProgressObserver: NSObject {
    
    private var finishObservation: NSKeyValueObservation?
    private var cancelObservation: NSKeyValueObservation?
    
    var progress: Progress? {
        willSet {
            finishObservation = nil
            cancelObservation = nil
            guard let progress = newValue else { return }
            let changeHandler: (Progress, NSKeyValueObservedChange<Bool>) -> Void = { [weak self] (obj, change) in
                if change.newValue ?? false {
                    if let strongSelf = self {
                        DispatchQueue.main.async { strongSelf.performCompletionWork() }
                    }
                }
            }
            finishObservation = progress.observe(\.isFinished, options: [.new], changeHandler: changeHandler)
            cancelObservation = progress.observe(\.isCancelled, options: [.new], changeHandler: changeHandler)
        }
    }
    
    var completionWork: (()->Void)?

    weak var storage: NSMutableSet?
    
    func performCompletionWork() {
        progress = nil
        completionWork?()
        completionWork = nil
        storage?.remove(self)
    }
}
