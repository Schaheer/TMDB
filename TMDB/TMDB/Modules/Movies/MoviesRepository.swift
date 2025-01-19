//
//  MoviesRepository.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

protocol MoviesRepositoryProtocol {
    func getPopularMovies(request: PopularMoviesRequest) async throws -> MoviesResponse?
}

class MoviesRepository: MoviesRepositoryProtocol {
    func getPopularMovies(request: PopularMoviesRequest) async throws -> MoviesResponse? {
        guard let url = URLHelper.generateURL(baseEndpoint: Constants.baseURL, withPath: Endpoint.popular.rawValue, queryParams: request.dictionary) else {
            throw NetworkError.invalidURL
        }
        
        let response = try await NetworkManager().request(
            method: .get,
            url: url,
            headers: ["accept": "application/json", "Authorization": "Bearer \(Constants.APIReadAccessToken)"],
            params: [:],
            of: MoviesResponse.self
        )
        
        return response
    }
}
