//
//  APIConfig.swift
//  Dragon Ride
//
//  Created by troquer on 7/18/21.
//  Copyright © 2021 Andrés A. All rights reserved.
//

import Foundation

final class APIConfig2 {

    let host = Environment.baseURL
    let scheme = "http"
    
    var baseURL: URLComponents {
        var urlComponents = URLComponents()
        urlComponents.scheme = scheme
        urlComponents.host = host
        return urlComponents
    }
    
    enum Target: String {
        case current = ""
        
        var path: String {
                switch self {
                    case .current:
                        return ""
            }
        }
    }
    
    func makeURL(with target: Target) -> URL? {
        var urlComponents = baseURL
        urlComponents.path = target.path
        guard let url = urlComponents.url else {
            print("Error create url")
            return nil
        }
        
        return url
        
    }

};extension URLComponents {
    mutating func setQueryItems<T: LosslessStringConvertible>(with parameters: [String: T]) {
        self.queryItems = parameters.map { URLQueryItem(name: $0.key, value: String($0.value)) }
    }
}

