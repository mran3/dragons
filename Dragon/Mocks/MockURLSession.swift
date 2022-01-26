//
//  MockURLSession.swift
//  Dragon Riders UnitTests
//
//  Created by Andres Acevedo on 25/01/22.
//  Copyright © 2022 Andrés A. All rights reserved.
//

import Foundation

class MockURLSession: URLSessionProtocol {
    private (set) var lastURL: URL?
    private (set) var nextDataTask: MockURLSessionDataTask!
    
    func dataTaskWithUrl(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        lastURL = url
        nextDataTask = MockURLSessionDataTask()
        return nextDataTask
    }
    
}

class MockURLSessionDataTask: URLSessionDataTaskProtocol {
    private (set) var resumeWasCalled = false
    
    func resume() {
        resumeWasCalled = true
    }
}
