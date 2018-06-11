//
//  HTTPError.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/21/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

enum NetworkError: Error {
    case missingParamters
    case encodingFailed
    case decodingFailed
    case missingURL
    case missingData
}

