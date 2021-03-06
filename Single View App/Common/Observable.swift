//
//  Observable.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 15/05/21.
//


import Foundation

final class Observable<T> {
    
    typealias Listener = (T) -> Void
    var listener: Listener?
    
    var value: T {
        didSet {
            listener?(value)
        }
    }
    
    init(_ value: T) {
        self.value = value
    }
    
    func bind(listener: Listener?) {
        self.listener = listener
        listener?(value)
    }
    
    func update() {
        listener?(value)
    }
}
