//
//  MoviesViewController.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit

class MoviesViewController: BaseVC {
    var viewModel: MoviesViewModelProtocol!
    var currentView: MoviesView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setupBindings()
    }
    
    func setupViews() {
        currentView = view as? MoviesView
        
        showHUD()
        viewModel.getPopularMovies()
    }
    
    func setupBindings() {
        viewModel.resultsCompletion = { [weak self] results in
            self?.currentView.collectionView.reloadData()
        }
        
        viewModel.showHUD = { [weak self] showHUD in
            showHUD ? self?.showHUD() : self?.hideHUD()
        }
        
        viewModel.error = { [weak self] error in
            self?.showAlert(with: error)
        }
    }
}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.results?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieCell.self)", for: indexPath) as? MovieCell {
            let movie = viewModel.results?[indexPath.row]
            
            cell.setCell(with: movie?.poster_path ?? "")
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let movie = viewModel.results?[indexPath.row]
        
        MoviesRouter().navigateToMovieDetail(from: self, movieID: movie?.id)
    }
}
