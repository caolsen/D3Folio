//
//  JSONParser.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/24/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

/// Decode data into an object of Type T that conforms to Decodable.
class JSONParser: Parser {
    
    static func parse<T: Decodable>(data: Data) throws -> T {
        do {
            return try JSONDecoder().decode(T.self, from: data)
        } catch {
            throw NetworkError.decodingFailed
        }
    }
}

