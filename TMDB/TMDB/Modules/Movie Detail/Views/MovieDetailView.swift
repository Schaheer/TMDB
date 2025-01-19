//
//  MovieDetailView.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit

class MovieDetailView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var overviewLabel: UILabel!
    @IBOutlet weak var releaseDateLabel: UILabel!
    @IBOutlet weak var revenueLabel: UILabel!
    @IBOutlet weak var budgetLabel: UILabel!
    @IBOutlet weak var genresLabel: UILabel!
    @IBOutlet weak var statusLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        imageView.kf.indicatorType = .activity
    }
    
    func setViews(with detail: MovieDetailResponse?) {
        if let url = URL(string: Constants.imageBaseURL + (detail?.poster_path ?? "")) {
            imageView.kf.setImage(with: url, placeholder: UIImage() /*UIImage(systemName: "popcorn.fill")*/, options: [.transition(.fade(1))])
        }
        
        titleLabel.text = "Title: \(detail?.title ?? "")"
        overviewLabel.text = "Overview: \(detail?.overview ?? "")"
        releaseDateLabel.text = "Release Date: \(detail?.release_date ?? "")"
        revenueLabel.text = "Revenue: $\(detail?.revenue ?? 0)"
        budgetLabel.text = "Budget: $\(detail?.budget ?? 0)"
        genresLabel.text = "Genres: \(detail?.genres?.map({ $0.name ?? "" }).joined(separator: ", ") ?? "")"
        statusLabel.text = "Status: \(detail?.status ?? "")"
    }
    
}


