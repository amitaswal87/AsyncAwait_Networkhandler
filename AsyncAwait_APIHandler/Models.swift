//
//  Models.swift
//  AsyncAwait_APIHandler
//
//  Created by apple  on 08/07/24.
//

import Foundation

enum NetworkError : Error{
    case invalidResponse(Int)
    case networkError(Error)
    case parsingError(Error)
}

struct User : Decodable{
    let id : Int
    let name : String
}
