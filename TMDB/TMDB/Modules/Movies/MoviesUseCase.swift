//
//  MoviesUseCase.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

protocol MoviesUseCaseProtocol {
    func getPopularMovies(request: PopularMoviesRequest) async throws -> MoviesResponse?
}

class MoviesUseCase: MoviesUseCaseProtocol {
    private var repository: MoviesRepositoryProtocol
    
    init(repository: MoviesRepositoryProtocol) {
        self.repository = repository
    }
    
    func getPopularMovies(request: PopularMoviesRequest) async throws -> MoviesResponse? {
        try await repository.getPopularMovies(request: request)
    }
}
