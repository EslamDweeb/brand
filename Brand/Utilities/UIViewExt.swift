//
//  UIViewExt.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//
import Foundation
import UIKit

extension UIView {
    // function take 2 colors and startPoint & endPoint (Start of Gradient and End of it) and location(where the to color seprate) to set gradient
    func setFont(name: String , size : CGFloat) -> UIFont {
        return UIFont(name: name, size: size)!
    }
    func setGradientBackground(firstColor:UIColor,secondColor:UIColor,thirdColor:UIColor,startPoint: CGPoint,endPoint: CGPoint,location: [NSNumber]) {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor,secondColor.cgColor,thirdColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = location
        gradientLayer.frame = self.bounds
        layer.insertSublayer(gradientLayer, at: 0)
    }
    func gradientLayer(firstColor:UIColor,secondColor:UIColor,thirdColor:UIColor,startPoint: CGPoint,endPoint: CGPoint,location: [NSNumber]) -> CAGradientLayer {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [firstColor.cgColor,secondColor.cgColor,thirdColor.cgColor]
        gradientLayer.startPoint = startPoint
        gradientLayer.endPoint = endPoint
        gradientLayer.locations = location
        gradientLayer.frame = self.bounds
       return gradientLayer
    }
    // Set cornerRadius for each element inherit from UIView if raduis is equal to nil will make it circular
    func setCornerRadius(radius: CGFloat? = nil) {
        layer.cornerRadius = radius ?? frame.width / 2
    }
    /* Drop shadow for each element inherit from UIView
     - shadowColor = set the shadow’s color
     - shadowOffset = sets how far away from the view the shadow should be, to give a 3D offset effect
     - shadowRadius = sets how wide the shadow should be
     -  shadowOpacity = sets how transparent the shadow is, where 0 is invisible and 1 is as strong as possible
     **/
    func setShadow(shadowColor: CGColor,shadowOffset: CGSize,shadowOpacity: Float,shadowRaduis: CGFloat) {
        layer.shadowRadius = shadowRaduis
        layer.shadowColor = shadowColor
        layer.shadowOffset = shadowOffset
        layer.shadowOpacity = shadowOpacity
    }
    // Set constrains to view
    func anchor(top: NSLayoutYAxisAnchor?, left: NSLayoutXAxisAnchor?, bottom: NSLayoutYAxisAnchor?, right: NSLayoutXAxisAnchor?, centerX:NSLayoutXAxisAnchor?,centerY: NSLayoutYAxisAnchor?,paddingTop: CGFloat,paddingLeft: CGFloat,paddingBottom: CGFloat,paddingRight: CGFloat, width: CGFloat,height: CGFloat,paddingCenterX: CGFloat,paddingCenterY: CGFloat) {
        translatesAutoresizingMaskIntoConstraints = false
        
        if let top = top {
            topAnchor.constraint(equalTo: top, constant:paddingTop).isActive = true
        }
        
        if let left = left {
            leftAnchor.constraint(equalTo: left, constant: paddingLeft).isActive = true
        }
        
        if let bottom = bottom {
            bottomAnchor.constraint(equalTo: bottom, constant:-paddingBottom).isActive = true
        }
        
        if let right = right {
            rightAnchor.constraint(equalTo: right, constant: -paddingRight).isActive = true
        }
        
        if width != 0 {
            widthAnchor.constraint(equalToConstant: width).isActive = true
        }
        
        if height != 0 {
            heightAnchor.constraint(equalToConstant: height).isActive = true
        }
        if let centerX = centerX {
            centerXAnchor.constraint(equalTo: centerX, constant: paddingCenterX).isActive = true
        }
        if let centerY = centerY {
            centerYAnchor.constraint(equalTo: centerY, constant: paddingCenterY).isActive = true
        }
    }
    func activityStartAnimating(activityColor: UIColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1) , backgroundColor: UIColor = .clear ) {
        let backgroundView = UIView()
        backgroundView.frame = CGRect.init(x: 0, y: 0, width: self.bounds.width, height: self.bounds.height)
        backgroundView.backgroundColor = backgroundColor
        backgroundView.tag = 475647
        
        var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
        activityIndicator = UIActivityIndicatorView(frame: CGRect.init(x: 0, y: 0, width: 50, height: 50))
        activityIndicator.center = self.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.whiteLarge
        activityIndicator.color = activityColor
        activityIndicator.startAnimating()
        self.isUserInteractionEnabled = false
        
        backgroundView.addSubview(activityIndicator)
        
        self.addSubview(backgroundView)
    }
    
    func activityStopAnimating() {
        if let background = viewWithTag(475647){
            background.removeFromSuperview()
        }
        self.isUserInteractionEnabled = true
    }
    func roundCorners(_ corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
}


extension UITableViewCell {
    static func getIdentifier () -> String  {
        return String(describing: self )
    }
}
