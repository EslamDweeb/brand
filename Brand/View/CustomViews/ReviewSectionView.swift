//
//  ReviewSectionView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class ReviewSectionView:UIView {

     lazy var titleLable:UILabel = {
      let title = UILabel()
        title.font = UIFont(name: "Avenir-Medium", size: 16)
        title.textColor = .black
        return title
    }()
    private lazy var textContainerView: UIView = {
        let view = UIView()
        return view
    }()
     lazy var textView:UITextView = {
        let text = UITextView()
        text.font = UIFont(name: "Avenir-Medium", size: 12)
        text.text = "Speaking comes to most people as naturally as breathing. On many occasions our words are uttered without conscious thought; in fact we rarely stop and think about what we are saying. Thousands of words"
        text.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.3)
        return text
    }()
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.borderWidth = 1
        self.layer.borderColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.1588516695)
        textContainerView.layer.borderWidth = 1
        textContainerView.layer.borderColor = #colorLiteral(red: 0.8588235294, green: 0.8588235294, blue: 0.8588235294, alpha: 1)
        textContainerView.layer.cornerRadius = 5
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        addSubview(titleLable)
        addSubview(textContainerView)
        textContainerView.addSubview(textView)
    }
    private func addConstrainsToUI() {
        if MOLHLanguage.currentAppleLanguage() == "en" {
        titleLable.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 60, height: 25, paddingCenterX: 0, paddingCenterY: 0)
        }else{
        titleLable.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 60, height: 25, paddingCenterX: 0, paddingCenterY: 0)
        }
        textContainerView.anchor(top: titleLable.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 10, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 70, paddingCenterX: 0, paddingCenterY: 0)
        textView.anchor(top: textContainerView.topAnchor, left: textContainerView.leftAnchor, bottom: textContainerView.bottomAnchor, right: textContainerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 5, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
