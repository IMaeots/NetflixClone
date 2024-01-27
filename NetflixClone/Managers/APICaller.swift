//
//  APICaller.swift
//  NetflixClone
//
//  Created by Indrek Mäeots on 27.01.2024.
//

import Foundation

struct Constants {
    static let API_KEY = "2250b40975c57e49128d94b6dbbf0cde"
    static let API_READ_ACCESS_TOKEN = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiIyMjUwYjQwOTc1YzU3ZTQ5MTI4ZDk0YjZkYmJmMGNkZSIsInN1YiI6IjY1YjRlODVhNThlZmQzMDE3Y2NhNTg5MiIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.Zt4l_IDdlhZv4xLadA2bQbmLXkeLfI6sbaCQBs9ipuE"
    static let baseURL = "https://api.themoviedb.org"
}

enum APIError: Error {
    case failedToGetData
    case success
}

class APICaller {
    static let shared = APICaller()
    
    func getTrendingMovies(completion: @escaping (Result<[Movie], Error>) -> Void) {
        guard let url = URL(string: "\(Constants.baseURL)/3/trending/movie/day?language=en-US") else { return }
        
        var request = URLRequest(url: url)
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        request.addValue("Bearer \(Constants.API_READ_ACCESS_TOKEN)", forHTTPHeaderField: "Authorization")
        
        let task = URLSession.shared.dataTask(with: request) { data, _, error in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                let results = try JSONDecoder().decode(TrendingMoviesResponse.self, from: data)
                completion(.success(results.results))
            } catch {
                completion(.failure(error))
            }
        }
        
        task.resume()
    }
}
