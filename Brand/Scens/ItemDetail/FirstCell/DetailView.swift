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
    var tags:[Tag]?
    lazy var brandLable:UILabel = {
        let lbl = UILabel()
        return lbl
    }()
    lazy var madeInLable:UILabel = {
        let lbl = UILabel()
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
       // layout.estimatedItemSize =  CGSize(width: 60, height: 30)
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.backgroundColor = .white
        collection.register(TagsCell.self, forCellWithReuseIdentifier: cellID)
        collection.delegate = self
        collection.dataSource = self
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    lazy var lineView:UIView = {
       let line = UIView()
        line.backgroundColor = .lightgray3
        return line
    }()
    var brandNameHeight:NSLayoutConstraint?
    var TagsCollHeight:NSLayoutConstraint?
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        backgroundColor = .white
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
        brandLable.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        brandLable.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true
        brandNameHeight = brandLable.heightAnchor.constraint(equalToConstant: 0)
        brandNameHeight?.isActive = true
        infoBtn.anchor(top: nil, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: madeInLable.centerYAnchor, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 30, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        madeInLable.anchor(top: topAnchor, left: nil ,bottom: nil, right: infoBtn.leftAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        madeInLable.widthAnchor.constraint(greaterThanOrEqualToConstant: 30).isActive = true

        tagsCollection.anchor(top: madeInLable.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        TagsCollHeight = tagsCollection.heightAnchor.constraint(equalToConstant: 0)
        TagsCollHeight?.isActive = true
        lineView.anchor(top: nil, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
    }
    func setLableTitles(){
        let BrandattributedString = NSMutableAttributedString(string: "Brand : \(branTitle ?? "Apple")", attributes: [
            .font: UIFont(name: "Avenir-Heavy", size: 14.0)!,
            .foregroundColor: UIColor.black
            ])
        BrandattributedString.addAttributes([
            .font: UIFont(name: "Avenir-Medium", size: 12.0)!,
            .foregroundColor: UIColor(white: 135.0 / 255.0, alpha: 1.0)
            ], range: NSRange(location: 8, length: branTitle?.count ?? 5))
        brandLable.attributedText = BrandattributedString
        
        
        let attributedString = NSMutableAttributedString(string: "Made in : \(contryTitle ?? "France")", attributes: [
            .font: UIFont(name: "Avenir-Heavy", size: 14.0)!,
            .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
            ])
        attributedString.addAttributes([
            .font: UIFont(name: "Avenir-Medium", size: 12.0)!,
            .foregroundColor: UIColor(white: 135.0 / 255.0, alpha: 1.0)
            ], range: NSRange(location: 10, length: contryTitle?.count ?? 6))
        madeInLable.attributedText = attributedString
    }
}
extension DetailView:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tags?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)as?TagsCell else{return UICollectionViewCell()}
        cell.tags = tags?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: (collectionView.frame.width/5), height: 30)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 8
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            return 8
    }
    
}
