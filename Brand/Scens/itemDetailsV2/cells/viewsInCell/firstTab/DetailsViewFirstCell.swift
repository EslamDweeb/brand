//
//  File.swift
//  Brand
//
//  Created by iOS on 9/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

protocol DelegateDetailsViewFirstCell : class  {
    func actionButtonInfo(_ sender : UIButton)
    func actionTapOnTag (tag : Tag )
}

class DetailsViewFirstCell : UIView {
    
   
    private var tags : [Tag] = []
    private var heightCollectionView : NSLayoutConstraint?
    
    weak var delegate : DelegateDetailsViewFirstCell?
    
    lazy var labelBrand : UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "Avenir-Medium", size: 12)
        return l
    }()
    
    lazy var labelMadeIn : UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "Avenir-Medium", size: 12)
        return l
    }()
    
    lazy var buttonInfo : UIButton = {
        let b = UIButton()
        let image = UIImage(named: "info6")
        b.setImage(image, for: .normal)
        b.imageEdgeInsets = UIEdgeInsets(top: 10, left: 10 , bottom: 10 , right: 10 )
        b.addTarget(self , action: #selector(actionTapInfo(_ :)), for: .touchUpInside )
        return b
    }()
    
    lazy var collectionViewTags : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
       let c = UICollectionView(frame: .zero , collectionViewLayout: layout)
        c.backgroundColor = .white
        c.register(TagsCell.self , forCellWithReuseIdentifier: TagsCell.getIdentifier())
        c.delegate = self
        c.dataSource = self
        return c
        
    }()
    
    lazy var bottomLine : UIView = {
       let v = UIView ()
        v.backgroundColor = .lightgray3
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    private func initViews () {
        addViews()
    }
    
    private func addViews () {
        addSubview(labelBrand)
        addSubview(labelMadeIn)
        addSubview(buttonInfo)
        addSubview(collectionViewTags)
        addSubview(bottomLine)
        
        labelBrand.anchor(top: self.topAnchor , leading: self.leadingAnchor , paddingTop: 16 , paddingLeft: 16 )
        buttonInfo.anchor( trailing: self.trailingAnchor , centerY: labelMadeIn.centerYAnchor , paddingRight: 8 , width: 45, height: 45 )
        labelMadeIn.anchor(top: topAnchor , trailing: buttonInfo.leadingAnchor , paddingTop: 16 , paddingRight: 16 )
        
        collectionViewTags.anchor(top: labelMadeIn.bottomAnchor , leading: self.leadingAnchor , bottom: self.bottomLine.topAnchor , trailing: self.trailingAnchor , paddingTop: 8 , paddingLeft: 8 , paddingRight: 8 )
        heightCollectionView = collectionViewTags.heightAnchor.constraint(equalToConstant: 40)
        heightCollectionView?.isActive = true
        
        bottomLine.anchor(top: collectionViewTags.bottomAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor , trailing: self.trailingAnchor , height: 1 )
        
    }
    
    func setData (brandTitle : String , countryTitle : String , tags : [Tag]) {
        self.tags = tags
        if self.tags.count > 0 {
            self.collectionViewTags.reloadData()
        }else {
            heightCollectionView?.constant = 0
        }
        
        let BrandattributedString = NSMutableAttributedString(string: "Brand : \(brandTitle)", attributes: [
            .font: UIFont(name: "Avenir-Heavy", size: 14.0)!,
            .foregroundColor: UIColor.black
            ])
        BrandattributedString.addAttributes([
            .font: UIFont(name: "Avenir-Medium", size: 12.0)!,
            .foregroundColor: UIColor(white: 135.0 / 255.0, alpha: 1.0)
            ], range: NSRange(location: 8, length: brandTitle.count))
        labelBrand.attributedText = BrandattributedString
        
        let attributedString = NSMutableAttributedString(string: "Made in : \(countryTitle )", attributes: [
            .font: UIFont(name: "Avenir-Heavy", size: 14.0)!,
            .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
            ])
        attributedString.addAttributes([
            .font: UIFont(name: "Avenir-Medium", size: 12.0)!,
            .foregroundColor: UIColor(white: 135.0 / 255.0, alpha: 1.0)
            ], range: NSRange(location: 10, length: countryTitle.count))
        labelMadeIn.attributedText = attributedString
    }
    
    @objc private func actionTapInfo (_ sender : UIButton) {
        self.delegate?.actionButtonInfo(sender)
    }
    
}

extension DetailsViewFirstCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.tags.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagsCell.getIdentifier() , for: indexPath) as! TagsCell
        cell.tagLable.text = tags[indexPath.row].name
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.actionTapOnTag(tag: tags[indexPath.row])
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = tags[indexPath.row].name
        let font = UIFont(name: "Avenir-Medium", size: 12)
        let fontAttributes : [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 12 )]
        let size = (text as NSString ).size(withAttributes: fontAttributes)
        return CGSize(width: size.width + 32 , height: size.height + 16 )
    }
    
    
    
}
