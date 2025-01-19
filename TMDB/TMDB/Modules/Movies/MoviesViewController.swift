//
//  MoviesViewController.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit

class MoviesViewController: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
}

extension MoviesViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "\(MovieCell.self)", for: indexPath) as? MovieCell {
            
            return cell
        }
        
        return UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        MoviesRouter().navigateToMovieDetail(from: self)
    }
}
