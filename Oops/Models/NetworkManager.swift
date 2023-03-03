//
//  NetworkManager.swift
//  Oops
//
//  Created by Ethan Gonsalves on 2023-03-01.
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
 
    private init() {}
    
    
    func fetchMovie(completed: @escaping(Result<[Movie], MovieError>) -> Void) {
        
        let endPoint = "https://api.tvmaze.com/shows"
        
        guard let url = URL(string: endPoint) else {
            completed(.failure(.invalidUrlLink))
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            
            if let _ = error {
                completed(.failure(.unableToComplete))
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidData))
                return
            }

            do {
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                let movieDetails = try decoder.decode([Movie].self, from: data)
                completed(.success(movieDetails))
            } catch {
                completed(.failure(.invalidData))
            }
            
        }
        
        task.resume()
    }

}
