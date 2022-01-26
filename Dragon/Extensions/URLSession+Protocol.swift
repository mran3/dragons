////
////  URLSession+Protocol.swift
////  Dragon Riders
////  This allows to mock URLSession for Unit Testing
//
////  Created by Andres Acevedo on 25/01/22.
////  Copyright © 2022 Andrés A. All rights reserved.
////

import Foundation

protocol URLSessionProtocol {
    func dataTaskWithUrl(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol
}
typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void

extension URLSession: URLSessionProtocol {
    func dataTaskWithUrl(with url: URL, completionHandler: @escaping DataTaskResult) -> URLSessionDataTaskProtocol {
        self.dataTask(with: url, completionHandler: completionHandler)
    }
}


protocol URLSessionDataTaskProtocol {
    func resume()
}

extension URLSessionDataTask: URLSessionDataTaskProtocol { }







//import Foundation
//
//protocol URLSessionProtocol {
//    func dataTaskWithURL(_ url: URL, completion: @escaping DataTaskResult) -> URLSessionDataTask
//}
//typealias DataTaskResult = (Data?, URLResponse?, Error?) -> Void
//extension URLSession: URLSessionProtocol {
//    func dataTaskWithURL(_ url: URL, completion: @escaping DataTaskResult) -> URLSessionDataTask {
//        self.dataTask(with: url, completionHandler: completion)
//    }
//
//}

