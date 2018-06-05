//
//  NetworkService.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

typealias NetworkServiceCompletion = (_ data: Data?, _ response: URLResponse?, _ error: Error?) -> Void

protocol NetworkService: class {
    func request(_ route: Endpoint, completion: @escaping NetworkServiceCompletion)
    func cancel()
}

