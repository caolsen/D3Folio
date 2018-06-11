//
//  Endpoint.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

typealias HTTPHeaders = [String: String]

protocol Endpoint {
    var baseURL: URL { get }
    var path: String { get }
    var fullURL: URL { get }
    var method: HTTPMethod { get }
    var task: HTTPTask { get }
    var headers: HTTPHeaders? { get }
}

extension Endpoint {
    var fullURL: URL {
        return baseURL.appendingPathComponent(path)
    }
}

