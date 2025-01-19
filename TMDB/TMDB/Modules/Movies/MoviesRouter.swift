//
//  MoviesRouter.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

class MoviesRouter {
    
    static func createModule() -> MoviesViewController {
        let repository = MoviesRepository()
        let useCase = MoviesUseCase(repository: repository)
        let viewModel = MoviesViewModel(useCase: useCase)
        
        let vc = MoviesViewController.instantiateFromMainStoryboard()
        vc.viewModel = viewModel
        
        return vc
    }
    
    func navigateToMovieDetail(from vc: BaseVC, movieID: Int?) {
        let destinationVC = MovieDetailRouter.createModule(with: movieID)
        
        vc.pushVC(destinationVC)
    }
    
}
