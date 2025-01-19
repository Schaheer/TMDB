//
//  MovieDetailRouter.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

class MovieDetailRouter {
    
    static func createModule(with movieID: Int?) -> MovieDetailViewController {
        let repository = MovieDetailRepository()
        let useCase = MovieDetailUseCase(repository: repository)
        let viewModel = MovieDetailViewModel(useCase: useCase)
        
        let vc = MovieDetailViewController.instantiateFromMainStoryboard()
        vc.viewModel = viewModel
        vc.movieID = movieID
        
        return vc
    }
    
}
