//
//  URLSessionDataTaskMock.swift
//  Single View App
//
//  Created by Vijay Bhaskar on 16/05/21.
//https://www.swiftbysundell.com/articles/mocking-in-swift/


import UIKit

// We create a partial mock by subclassing the original class
class URLSessionDataTaskMock: URLSessionDataTask {
    private let closure: () -> Void

    init(closure: @escaping () -> Void) {
        self.closure = closure
    }

    // We override the 'resume' method and simply call our closure
    // instead of actually resuming any task.
    override func resume() {
        closure()
    }
}
