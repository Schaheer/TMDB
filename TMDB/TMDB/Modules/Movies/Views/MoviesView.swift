//
//  MoviesView.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit
import EmptyDataSet_Swift

class MoviesView: UIView {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let minimumInteritemSpacing: CGFloat = 16
    let inset: CGFloat = 24
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        setupCollectionView()
        setEmptyData()
    }
    
    func setupCollectionView() {
        collectionView.register(UINib(nibName: "\(MovieCell.self)", bundle: nil), forCellWithReuseIdentifier: "\(MovieCell.self)")
        
        let layout = UICollectionViewFlowLayout()
        let cellWidth = (UIScreen.main.bounds.width - (2 * 24) - minimumInteritemSpacing) / 2
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: cellWidth, height: 180)
        layout.minimumLineSpacing = minimumInteritemSpacing
        layout.minimumInteritemSpacing = minimumInteritemSpacing
        layout.sectionInset = UIEdgeInsets(top: inset, left: inset, bottom: inset, right: inset)
        
        collectionView.collectionViewLayout = layout
    }
    
    func setEmptyData() {
        collectionView.emptyDataSetView { view in
            let noDataString = NSMutableAttributedString(string: "No Data!")
            
            view.titleLabelString(noDataString)
                .shouldFadeIn(true)
        }
    }
    
}
