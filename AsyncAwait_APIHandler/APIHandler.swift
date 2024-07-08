//
//  APIHandler.swift
//  AsyncAwait_APIHandler
//
//  Created by apple  on 08/07/24.
//

import Foundation

class APIHandler{
    
    func fetchData(url : URL ) async throws -> Data{
        
        do {
            let (data,response) = try await URLSession.shared.data(from: url)
            if let finalResponse = response as? HTTPURLResponse , finalResponse.statusCode != 200 {
                throw NetworkError.invalidResponse(finalResponse.statusCode)
            }
            return data
        }catch NetworkError.networkError(let error){
            throw NetworkError.networkError(error)
        }
    }
}
