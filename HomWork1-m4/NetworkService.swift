//
//  NetworkService.swift
//  HomWork1-m4
//
//  Created by Sultanbai Almaz on 16/8/23.
//

import Foundation

class NetworkService {
    
    static let shared = NetworkService()
    
    func fetchData(completion: @escaping (Result<[Product],Error>) -> Void) {
        let url = URL(string: "https://dummyjson.com/products")
        
        //let request = URLRequest(url: Constants.API.getURLProduct())
        let request = URLRequest(url: url!)
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            guard let safeData = data else { return }
            if let error = error {
                print(error.localizedDescription)
            }
            do {
                let model = try JSONDecoder().decode(Products.self, from: safeData)
                completion(.success(model.products))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
}
