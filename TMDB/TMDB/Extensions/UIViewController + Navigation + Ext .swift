//
//  UIViewController + Navigation + Ext .swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit

extension UIViewController {
    
    // Instantiate a view controller from a specific storyboard
    static func instantiate(fromStoryboard storyboardName: String) -> Self {
        return instantiateViewController(fromStoryboard: storyboardName)
    }
    
    // Convenience method to instantiate from Main.storyboard
    static func instantiateFromMainStoryboard() -> Self {
        return instantiateViewController(fromStoryboard: "Main")
    }
    
    // Helper method to instantiate a view controller
    private static func instantiateViewController<T: UIViewController>(fromStoryboard storyboardName: String) -> T {
        let storyboard = UIStoryboard(name: storyboardName, bundle: nil)
        let identifier = String(describing: self)
        guard let viewController = storyboard.instantiateViewController(withIdentifier: identifier) as? T else {
            fatalError("ViewController with identifier \(identifier) could not be instantiated.")
        }
        
        return viewController
    }
    
}

extension UIViewController {
    
    // Push a view controller onto the navigation stack
    func pushVC(_ viewController: UIViewController, animated: Bool = true) {
        self.navigationController?.pushViewController(viewController, animated: animated)
    }
    
    // Pop the top view controller from the navigation stack
    @discardableResult
    func popVC(animated: Bool = true) -> UIViewController? {
        return self.navigationController?.popViewController(animated: animated)
    }
    
    // Pop to the root view controller of the navigation stack
    @discardableResult
    func popToRootVC(animated: Bool = true) -> [UIViewController]? {
        return self.navigationController?.popToRootViewController(animated: animated)
    }
    
    // Pop to a specific view controller type in the navigation stack
    @discardableResult
    func popToVC<T: UIViewController>(_ viewControllerClass: T.Type, animated: Bool = true) -> [UIViewController]? {
        guard let viewController = self.navigationController?.viewControllers.first(where: { $0 is T }) else {
            return nil
        }
        return self.navigationController?.popToViewController(viewController, animated: animated)
    }
    
    // Check if the view controller is being pushed onto the navigation stack
    var isBeingPushed: Bool {
        return self.navigationController?.viewControllers.last == self && self.isMovingToParent
    }
    
    // Check if the view controller is being popped from the navigation stack
    var isBeingPopped: Bool {
        return self.navigationController?.viewControllers.contains(self) == false && self.isMovingFromParent
    }
}
