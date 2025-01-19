//
//  MovieDetailViewModel.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

protocol MovieDetailViewModelProtocol {
    var dataResponse: MovieDetailResponse? { get }
    var dataCompletion: ((MovieDetailResponse?) -> Void) { get set }
    
    var showHUD: ((Bool) -> Void) { get set }
    var error: ((String) -> Void) { get set }
    
    func getMovieDetail(movieID: Int)
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var dataResponse: MovieDetailResponse? = nil
    var dataCompletion: ((MovieDetailResponse?) -> Void) = { _ in }
    
    var showHUD: ((Bool) -> Void) = { _ in }
    var error: ((String) -> Void) = { _ in }
    
    private let useCase: MovieDetailUseCaseProtocol
    
    init(useCase: MovieDetailUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getMovieDetail(movieID: Int) {
        showHUD(true)
        
        Task {
            do {
                // Check network connectivity
                if await NetworkManager.isConnectedToNetwork() {
                    let data = try await useCase.getMovieDetail(movieID: movieID)
                    dataResponse = data
                    
                    // Cache the data in UserDefaults
                    cacheMovieDetail(data, movieID: movieID)
                    
                    DispatchQueue.main.async {
                        self.dataCompletion(data)
                    }
                } else {
                    // Fetch cached data
                    if let cachedData = fetchCachedMovieDetail(movieID: movieID) {
                        DispatchQueue.main.async {
                            self.dataCompletion(cachedData)
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
                    self.dataCompletion(nil)
                }
                showHUD(false)
            }
        }
    }
    
    private func cacheMovieDetail(_ detail: MovieDetailResponse?, movieID: Int) {
        guard let detail = detail else { return }
        
        let key = "movie_detail_\(movieID)"
        if let encodedData = try? JSONEncoder().encode(detail) {
            UserDefaults.standard.set(encodedData, forKey: key)
        }
    }
    
    private func fetchCachedMovieDetail(movieID: Int) -> MovieDetailResponse? {
        let key = "movie_detail_\(movieID)"
        guard let savedData = UserDefaults.standard.data(forKey: key),
              let movieDetail = try? JSONDecoder().decode(MovieDetailResponse.self, from: savedData) else {
            return nil
        }
        return movieDetail
    }
}
