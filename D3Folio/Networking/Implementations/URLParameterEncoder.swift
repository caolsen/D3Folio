//
//  URLParameterEncoder.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// Adds query parameters to a URL.
class URLParameterEncoder: ParameterEncoder {
    
    static func encode(request: inout URLRequest, with parameters: Parameters) throws {
        guard let url = request.url else { throw NetworkError.missingURL }
        
        if var urlComponents = URLComponents(url: url, resolvingAgainstBaseURL: false), !parameters.isEmpty {
            urlComponents.queryItems = [URLQueryItem]()

            // check that parameters contain only characters allowed in URLs
            // add to urlComponents
            parameters.forEach {
                let value = "\($0.value)".addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)
                let queryItem = URLQueryItem(name: $0.key, value: value)
                urlComponents.queryItems?.append(queryItem)
            }
            
            request.url = urlComponents.url
        }
    }
}

