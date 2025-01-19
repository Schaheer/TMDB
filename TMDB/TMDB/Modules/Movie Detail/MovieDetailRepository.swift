//
//  MovieDetailRepository.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

protocol MovieDetailRepositoryProtocol {
    func getMovieDetail(movieID: Int) async throws -> MovieDetailResponse?
}

class MovieDetailRepository: MovieDetailRepositoryProtocol {
    func getMovieDetail(movieID: Int) async throws -> MovieDetailResponse? {
        guard let url = URLHelper.generateURL(baseEndpoint: Constants.baseURL, withPath: Endpoint.movie.rawValue + "\(movieID)", queryParams: nil) else {
            throw NetworkError.invalidURL
        }
        
        let response = try await NetworkManager().request(
            method: .get,
            url: url,
            headers: ["accept": "application/json", "Authorization": "Bearer \(Constants.APIReadAccessToken)"],
            params: [:],
            of: MovieDetailResponse.self
        )
        
        return response
    }
}
