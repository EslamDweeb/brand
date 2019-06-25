//
//  IntroPageCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class IntroPageCell: UICollectionViewCell {
    var introPage: IntroPage? {
        didSet {
            guard let page = introPage else{return}
            introImage.image = UIImage(named: page.imageName)
            pageBody.text = page.pageBody
        }
    }
    private let introImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "store")
        imageView.translatesAutoresizingMaskIntoConstraints = false
         imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    private let pageBody: UITextView = {
        let textView = UITextView()
        textView.text = "We are happy to join us"
        textView.font  = UIFont(name: "Avenir-black", size: 18)
        textView.textAlignment = .center
        textView.isScrollEnabled = false
        textView.isEditable = false
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupLayout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setupLayout() {
        let topImageContainerView = UIView()
        addSubview(topImageContainerView)
        topImageContainerView.translatesAutoresizingMaskIntoConstraints = false
        
        topImageContainerView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        
        topImageContainerView.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        topImageContainerView.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
        topImageContainerView.addSubview(introImage)
        introImage.centerXAnchor.constraint(equalTo: topImageContainerView.centerXAnchor).isActive = true
        introImage.centerYAnchor.constraint(equalTo: topImageContainerView.centerYAnchor).isActive = true
        introImage.heightAnchor.constraint(equalTo: topImageContainerView.heightAnchor, multiplier: 0.5).isActive = true
        
        topImageContainerView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5).isActive = true
        
        addSubview(pageBody)
        pageBody.topAnchor.constraint(equalTo: topImageContainerView.bottomAnchor).isActive = true
        pageBody.leftAnchor.constraint(equalTo: leftAnchor, constant: 24).isActive = true
        pageBody.rightAnchor.constraint(equalTo: rightAnchor, constant: -24).isActive = true
        pageBody.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 20).isActive = true
    }
}
