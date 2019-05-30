//
//  Extensions.swift
//  MailProjectIPZ
//
//  Created by Vladyslav Vdovychenko on 5/25/19.
//  Copyright © 2019 Vladyslav Vdovychenko. All rights reserved.
//

import UIKit

class Extentions {
    
    static let shared = Extentions()
    
    let lightFont = "HelveticaNeue-Light"
    let boldFont = "HelveticaNeue-Bold"
    let screenSize = UIScreen.main.bounds
    
    private init() {}
}

extension UIView {
    
    func addSubviews(_ views: UIView ...) {
        views.forEach{addSubview($0)}
    }
    
    func addGradientBackground(firstColor: UIColor, secondColor: UIColor,
                               startPoint: CGPoint = CGPoint(x: 0, y: 0), endPoint: CGPoint = CGPoint(x: 1, y: 1)) {
        clipsToBounds = true
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor, secondColor.cgColor]
        gradientLayer.frame = self.bounds
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        self.layer.insertSublayer(gradientLayer, at: 0)
    }
}

extension UITextField
{
    func setBottomBorder(withColor color: UIColor = UIColor.white)
    {
        self.borderStyle = .none
        self.backgroundColor = UIColor.clear
        let width: CGFloat = 1.0
        
        let borderLine = UIView(frame: CGRect(x: 0, y: self.frame.height - width, width: self.frame.width, height: width))
        borderLine.backgroundColor = color
        self.addSubview(borderLine)
    }
}

extension UIView {
    
    // OUTPUT 1
    func dropShadow(scale: Bool = true) {
        layer.masksToBounds = false
        layer.shadowColor = UIColor.black.cgColor
        layer.shadowOpacity = 0.15
        layer.shadowOffset = CGSize(width: -1, height: 1)
        layer.shadowRadius = 5
        
        layer.shadowPath = UIBezierPath(rect: bounds).cgPath
        layer.shouldRasterize = true
        layer.rasterizationScale = scale ? UIScreen.main.scale : 1
    }
}

class Responder: NSObject {
    @objc func segmentedControlValueChanged(_ sender: UISegmentedControl) {
        
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


