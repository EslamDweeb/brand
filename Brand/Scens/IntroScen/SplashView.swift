//
//  SplashView.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SplashView:UIView {
    
    lazy var splashImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "logoSplash")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    lazy var SplashView: UIView = {
        let view = UIView()
        return view
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
         self.setGradientBackground(firstColor: .pink, secondColor: .gradColor1, thirdColor: .gradColor2, startPoint: CGPoint(x: 1, y: 0), endPoint: CGPoint(x: 0, y: 1), location: [0,0.5,1])
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        addSubview(SplashView)
        addSubview(splashImage)
        splashImage.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        splashImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        splashImage.heightAnchor.constraint(equalToConstant: 45).isActive = true
        splashImage.widthAnchor.constraint(equalToConstant: 250).isActive = true
        //self.prefersStatusBarHidden = true
        SplashView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
