//
//  Parser.swift
//  NetworkingLayer
//
//  Created by Christopher Olsen on 5/24/18.
//  Copyright © 2018 Christopher Olsen. All rights reserved.
//

import Foundation

protocol Parser {
    static func parse<T: Decodable>(data: Data) throws -> T
}

