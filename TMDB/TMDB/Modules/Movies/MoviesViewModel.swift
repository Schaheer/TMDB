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
    
    var showHUD: ((Bool) -> Void) { get set }
    var error: ((String) -> Void) { get set }
    
    func getPopularMovies()
}

class MoviesViewModel: MoviesViewModelProtocol {
    var results: [Results]? = nil
    var resultsCompletion: (([Results]?) -> Void) = { _ in }
    
    var showHUD: ((Bool) -> Void) = { _ in }
    var error: ((String) -> Void) = { _ in }
    
    private let useCase: MoviesUseCaseProtocol
    
    init(useCase: MoviesUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getPopularMovies() {
        showHUD(true)
        Task {
            do {
                // Check for network connectivity
                if await NetworkManager.isConnectedToNetwork() {
                    let data = try await useCase.getPopularMovies(request: PopularMoviesRequest(include_adult: false, include_video: false, language: "en-US", page: 1, sort_by: "popularity.desc"))
                    results = data?.results
                    
                    // Cache the response in UserDefaults
                    cacheMovies(data)
                    
                    DispatchQueue.main.async { [weak self] in
                        self?.resultsCompletion(data?.results)
                    }
                } else {
                    // Fetch cached data if available
                    if let cachedData = fetchCachedMovies() {
                        results = cachedData.results
                        
                        DispatchQueue.main.async { [weak self] in
                            self?.resultsCompletion(cachedData.results)
                        }
                    } else {
                        // No network and no cached data
                        throw NetworkError.noNetwork
                    }
                }
                
                showHUD(false)
            } catch {
                self.error(error.localizedDescription)
                DispatchQueue.main.async {
                    self.resultsCompletion(nil)
                }
                showHUD(false)
            }
        }
    }
    
    private func cacheMovies(_ moviesResponse: MoviesResponse?) {
        guard let moviesResponse = moviesResponse else { return }
        if let encodedData = try? JSONEncoder().encode(moviesResponse) {
            UserDefaults.standard.set(encodedData, forKey: "popular_movies")
        }
    }
    
    private func fetchCachedMovies() -> MoviesResponse? {
        guard let savedData = UserDefaults.standard.data(forKey: "popular_movies"),
              let moviesResponse = try? JSONDecoder().decode(MoviesResponse.self, from: savedData) else {
            return nil
        }
        return moviesResponse
    }
}
