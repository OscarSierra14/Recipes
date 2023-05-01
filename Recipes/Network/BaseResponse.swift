//
//  BaseResponse.swift
//  rickandmorty
//
//  Created by Oscar Sierra on 5/1/23.
//

import Foundation

struct BaseResponse<T: Codable>: Codable {
}

struct Response: Codable {
    let statusCode: Int
    let message: String?
}
