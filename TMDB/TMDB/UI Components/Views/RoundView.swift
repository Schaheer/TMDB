//
//  RoundView.swift
//  TMDB
//
//  Created by Schaheer on 19/01/2025.
//

import UIKit

//@IBDesignable
class RoundView: UIView {
    
    private var shapeLayer: CAShapeLayer!
    
    @IBInspectable var cornerRadius: CGFloat = 10 {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var fillColor: UIColor = .white {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var shadowColor: UIColor = .gray {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var shadowOpacity: Float = 1 {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var shadowOffset: CGSize = CGSize(width: 0, height: 3) {
        didSet {
            updateLayer()
        }
    }
    
    @IBInspectable var shadowRadius: CGFloat = 10 {
        didSet {
            updateLayer()
        }
    }
    
    override init(frame: CGRect) { // From code
        super.init(frame: frame)
        
        setupLayer()
    }
    
    required init?(coder aDecoder: NSCoder) { // From IB
        super.init(coder: aDecoder)
        
        setupLayer()
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        updateLayer()
    }
    
    private func setupLayer() {
        shapeLayer = CAShapeLayer()
        layer.insertSublayer(shapeLayer, at: 0)
        
        updateLayer()
    }
    
    private func updateLayer() {
        let path = UIBezierPath(roundedRect: bounds, cornerRadius: cornerRadius)
        shapeLayer.path = path.cgPath
        shapeLayer.fillColor = fillColor.cgColor
        shapeLayer.shadowColor = shadowColor.cgColor
        shapeLayer.shadowOpacity = shadowOpacity
        shapeLayer.shadowOffset = shadowOffset
        shapeLayer.shadowRadius = shadowRadius
        shapeLayer.masksToBounds = false
    }
}
