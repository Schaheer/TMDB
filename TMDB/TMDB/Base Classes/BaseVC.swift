//
//  BaseVC.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit
import SVProgressHUD

class BaseVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    func showAlert(with title: String) {
        DispatchQueue.main.async { [weak self] in
            let alert = UIAlertController(title: title, message: "", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Okay", style: .default))
            
            self?.present(alert, animated: true)
        }
    }
    
    func showHUD() {
        DispatchQueue.main.async {
            SVProgressHUD.show()
        }
    }
    
    func hideHUD() {
        DispatchQueue.main.async {
            SVProgressHUD.dismiss()
        }
    }
}
