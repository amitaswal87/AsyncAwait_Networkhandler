//
//  ViewModel.swift
//  AsyncAwait_APIHandler
//
//  Created by apple  on 08/07/24.
//

import Foundation

class ViewModel{
    
    let networkService : NetworkService = {
        return NetworkService.shared
    }()
    
    func fetchData() async throws -> User{
        
        if let finalUrl = URL(string: "https://56859040-b8eb-4748-9fb6-915f72e7d13e.mock.pstmn.io/user"){
            do{
                let parsedData = try await networkService.fetchRequest(type: User.self, url: finalUrl)
                return parsedData
            }catch let error{
                throw error
            }
        }
        return User(id: 0, name: "")
    }
}
