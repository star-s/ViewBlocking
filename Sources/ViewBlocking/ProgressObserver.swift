//
//  File.swift
//  
//
//  Created by Sergey Starukhin on 04/11/2019.
//

import Foundation

final class ProgressObserver: NSObject {
    
    private var observers = [NSKeyValueObservation]()
    
    var progress: Progress? {
        willSet {
            guard let progress = newValue else {
                observers.removeAll()
                return
            }
            let changeHandler: (Progress, NSKeyValueObservedChange<Bool>) -> Void = { [weak self] (obj, change) in
                guard change.newValue ?? false else {
                    return
                }
                guard let strongSelf = self else {
                    return
                }
                DispatchQueue.main.async { strongSelf.performCompletionWork() }
            }
            observers = [
                progress.observe(\.isFinished, options: [.new], changeHandler: changeHandler),
                progress.observe(\.isCancelled, options: [.new], changeHandler: changeHandler)
            ]
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
