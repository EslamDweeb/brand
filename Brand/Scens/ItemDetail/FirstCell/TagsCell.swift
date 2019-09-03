//
//  TagsCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class TagsCell:UICollectionViewCell {
    var selectCell:Bool?
    var tags: Tag? {
        didSet {
            guard let tag = tags else{return}
            
            tagLable.text = tag.name
        }
    }
    var configOptionValue:ConfigOptionValue? {
        didSet{
            guard let optionValue = configOptionValue else{return}
            tagLable.text = optionValue.value
            selectCell = optionValue.selected
            if selectCell ?? false {
               cardView.backgroundColor = .pink
            }
        }
    }
    lazy var cardView:UIView = {
        let v = UIView()
        v.backgroundColor = .lightgray3
        v.layer.cornerRadius = 5
        // v.setCornerRadius(radius: 5)
        return v
    }()
    lazy var tagLable:UILabel = {
        let lable = UILabel()
        lable.text = "Urgent"
        lable.textColor = .white
        lable.textAlignment = .center
        lable.font = UIFont(name: "Avenir-Medium", size: 12)
        lable.layer.cornerRadius = 5
        lable.clipsToBounds = true
//        lable.backgroundColor = .lightgray3
//        lable.layer.cornerRadius = 5
        return lable
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        self.backgroundColor = .clear
        addSubViews()
        addUIConstraints()
    }
    private func addSubViews() {
        self.addSubview(cardView)
        cardView.addSubview(tagLable)
         //self.addSubview(tagLable)
    }
    private func addUIConstraints() {
        cardView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        tagLable.anchor(top: cardView.topAnchor, left: cardView.leftAnchor, bottom: cardView.bottomAnchor, right: cardView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
//              tagLable.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right:rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
