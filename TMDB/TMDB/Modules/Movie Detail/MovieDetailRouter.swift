//
//  MovieDetailRouter.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import Foundation

class MovieDetailRouter {
    
    static func createModule() -> MovieDetailViewController {
        let vc = MovieDetailViewController.instantiateFromMainStoryboard()
        
        return vc
    }
    
}
