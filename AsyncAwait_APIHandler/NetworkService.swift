//
//  NetworkService.swift
//  AsyncAwait_APIHandler
//
//  Created by apple  on 08/07/24.
//

import Foundation


class NetworkService{
    
    static let shared : NetworkService = {
        return NetworkService()
    }()
    private let apiHandler = APIHandler()
    private let parsingHandler = ParsingHandler()
    
    private init() {
        
    }
    
    func fetchRequest<T:Decodable>(type : T.Type , url : URL) async throws -> T{
        do{
            let data = try await apiHandler.fetchData(url: url)
            let parsedData = try await parsingHandler.parseData(type: type.self, data: data)
            return parsedData
        }catch NetworkError.invalidResponse(let statusCode){
            throw NetworkError.invalidResponse(statusCode)
        }catch NetworkError.networkError(let error) {
            throw NetworkError.networkError(error)
        }catch NetworkError.parsingError(let error) {
            throw NetworkError.parsingError(error)
        }
    }
}
