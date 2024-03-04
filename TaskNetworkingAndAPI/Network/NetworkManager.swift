//
//  NetworkManager.swift
//  TaskNetworkingAndAPI
//
//  Created by Saleh Bin Essa on 04/03/2024.
//

import Foundation
import Alamofire

class NetworkManager {
    
    // MARK: API
   private let baseURL = "https://coded-pets-api-crud.eapi.joincoded.com/pets"
    
    
    // MARK: Singleton
    static let shared = NetworkManager()
    
    func fetchBooks(completion: @escaping ([Pet]?) -> Void) {
        
        AF.request(baseURL).responseDecodable(of: [Pet].self) {response in
            switch response.result {
            case .success(let pet):
                completion(pet)
            case .failure(let error):
                completion(nil)
                print(error)
            }
        }
    }
}
