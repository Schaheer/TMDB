//
//  MoviesViewModel.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

protocol MoviesViewModelProtocol {
    var results: [Results]? { get }
    var resultsCompletion: (([Results]?) -> Void) { get set }
    
    func getPopularMovies()
}

class MoviesViewModel: MoviesViewModelProtocol {
    var results = [Results]?(nil)
    var resultsCompletion: (([Results]?) -> Void) = { _ in }
    
    private let useCase: MoviesUseCaseProtocol
    
    init(useCase: MoviesUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getPopularMovies() {
        Task {
            do {
                let data = try await useCase.getPopularMovies(request: PopularMoviesRequest(include_adult: false, include_video: false, language: "en-US", page: 1, sort_by: "popularity.desc"))
                results = data?.results
                
                DispatchQueue.main.async {
                    self.resultsCompletion(data?.results)
                }
                
                print(data)
            } catch {
                print(error)
            }
        }
    }
}
