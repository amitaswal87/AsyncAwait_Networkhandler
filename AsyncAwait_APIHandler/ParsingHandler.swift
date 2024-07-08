//
//  ParsingHandler.swift
//  AsyncAwait_APIHandler
//
//  Created by apple  on 08/07/24.
//

import Foundation

class ParsingHandler{
    
    
    func parseData<T:Decodable>(type: T.Type , data : Data) async throws -> T{
        do {
            let parsedData = try JSONDecoder().decode(T.self, from: data)
            return parsedData
        }catch let error{
            throw NetworkError.parsingError(error)
        }
    }
}
