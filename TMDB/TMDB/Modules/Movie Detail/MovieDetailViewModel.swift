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
    
    func getMovieDetail(movieID: Int)
}

class MovieDetailViewModel: MovieDetailViewModelProtocol {
    var dataResponse: MovieDetailResponse? = nil
    var dataCompletion: ((MovieDetailResponse?) -> Void) = { _ in }
    
    private let useCase: MovieDetailUseCaseProtocol
    
    init(useCase: MovieDetailUseCaseProtocol) {
        self.useCase = useCase
    }
    
    func getMovieDetail(movieID: Int) {
        Task {
            do {
                let data = try await useCase.getMovieDetail(movieID: movieID)
                dataResponse = data
                
                DispatchQueue.main.async {
                    self.dataCompletion(data)
                }
                
                print(data)
            } catch {
                print(error)
            }
        }
    }
}
