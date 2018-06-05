//
//  JSONParameterEncoding.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

class JSONParameterEncoder: ParameterEncoder {
    
    static func encode(request: inout URLRequest, with parameters: Parameters) throws {
        guard request.url != nil else { throw NetworkError.missingURL }
        
        do {
            let data = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted)
            request.httpBody = data
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        } catch {
            throw NetworkError.encodingFailed
        }
    }
}

