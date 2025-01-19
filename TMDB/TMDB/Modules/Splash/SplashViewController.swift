//
//  SplashViewController.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit

class SplashViewController: BaseVC {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) { [weak self] in
            let vc = MoviesRouter.createModule()
            
            self?.navigationController?.setViewControllers([vc], animated: true)
        }
    }
}
