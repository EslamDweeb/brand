//
//  DetailView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DetailView: UIView {
    let cellID = "cellID"
    var branTitle: String?
    var contryTitle:String?
    lazy var brandLable:UILabel = {
        let lbl = UILabel()
        let attributedString = NSMutableAttributedString(string: "Brand : \(branTitle ?? "Apple")", attributes: [
            .font: UIFont(name: "Avenir-Heavy", size: 14.0)!,
            .foregroundColor: UIColor.black
            ])
        attributedString.addAttributes([
            .font: UIFont(name: "Avenir-Medium", size: 12.0)!,
            .foregroundColor: UIColor(white: 135.0 / 255.0, alpha: 1.0)
            ], range: NSRange(location: 8, length: branTitle?.count ?? 5))
        lbl.attributedText = attributedString
        return lbl
    }()
    lazy var madeInLable:UILabel = {
        let lbl = UILabel()
        let attributedString = NSMutableAttributedString(string: "Made in : \(contryTitle ?? "France")", attributes: [
            .font: UIFont(name: "Avenir-Heavy", size: 14.0)!,
            .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
            ])
        attributedString.addAttributes([
            .font: UIFont(name: "Avenir-Medium", size: 12.0)!,
            .foregroundColor: UIColor(white: 135.0 / 255.0, alpha: 1.0)
            ], range: NSRange(location: 10, length: contryTitle?.count ?? 6))
         lbl.attributedText = attributedString
        return lbl
    }()
    lazy var infoBtn:UIButton = {
        let btn = UIButton()
        let image = UIImage(named: "info6")
        btn.setImage(image, for: .normal)
        //btn.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        return btn
    }()
    lazy var tagsCollection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(TagsCell.self, forCellWithReuseIdentifier: cellID)
        //        collection.delegate = delegate
        //        collection.dataSource = dataSource
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    lazy var lineView:UIView = {
       let line = UIView()
        line.backgroundColor = .lightgray3
        return line
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        addSubViews()
        addConstraintsToViews()
    }
    private func addSubViews() {
        addSubview(brandLable)
        addSubview(madeInLable)
        addSubview(infoBtn)
        addSubview(tagsCollection)
        addSubview(lineView)
    }
    private func addConstraintsToViews() {
        brandLable.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: madeInLable.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        infoBtn.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: brandLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 30, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        madeInLable.anchor(top: topAnchor, left: nil, bottom: nil, right: infoBtn.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 24, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        tagsCollection.anchor(top: brandLable.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        lineView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
    }
}
