//
//  MovieDetailUseCase.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

protocol MovieDetailUseCaseProtocol {
    func getMovieDetail(movieID: Int) async throws -> MovieDetailResponse?
}

class MovieDetailUseCase: MovieDetailUseCaseProtocol {
    private var repository: MovieDetailRepositoryProtocol
    
    init(repository: MovieDetailRepositoryProtocol) {
        self.repository = repository
    }
    
    func getMovieDetail(movieID: Int) async throws -> MovieDetailResponse? {
        try await repository.getMovieDetail(movieID: movieID)
    }
}
