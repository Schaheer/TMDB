//
//  MovieDetailViewController.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit

class MovieDetailViewController: BaseVC {
    var viewModel: MovieDetailViewModelProtocol!
    var currentView: MovieDetailView!
    
    var movieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupBindings()
    }
    
    func setupViews() {
        currentView = view as? MovieDetailView
        
        showHUD()
        viewModel.getMovieDetail(movieID: movieID ?? 0)
    }
    
    func setupBindings() {
        viewModel.dataCompletion = { [weak self] data in
            self?.currentView.setViews(with: data)
        }
        
        viewModel.showHUD = { [weak self] showHUD in
            showHUD ? self?.showHUD() : self?.hideHUD()
        }
        
        viewModel.error = { [weak self] error in
            self?.showAlert(with: error)
        }
    }
}
