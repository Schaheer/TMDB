//
//  MoviesRouter.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

class MoviesRouter {
    
    static func createModule() -> MoviesViewController {
        let vc = MoviesViewController.instantiateFromMainStoryboard()
        
        return vc
    }
    
    func navigateToMovieDetail(from vc: BaseVC) {
        let destinationVC = MovieDetailRouter.createModule()
        
        vc.pushVC(destinationVC)
    }
    
}
