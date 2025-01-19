//
//  MovieCell.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit
import Kingfisher

class MovieCell: UICollectionViewCell {

    @IBOutlet weak var mainView: RoundView!
    @IBOutlet weak var imageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        mainView.fillColor = .TMBackground
        imageView.kf.indicatorType = .activity
    }
    
    func setCell(with imageString: String) {
        if let url = URL(string: Constants.imageBaseURL + imageString) {
            imageView.kf.setImage(with: url, placeholder: UIImage() /*UIImage(systemName: "popcorn.fill")*/, options: [.transition(.fade(1))])
        }
    }

}
