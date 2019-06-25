//
//  BrandCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Kingfisher

class BrandCell:UICollectionViewCell {
    var brand:Brand? {
        didSet{
            guard let brand = brand else {return}
            guard let index = brand.logoImage.path.firstIndex(of: " ") else {return}
            let path = String(brand.logoImage.path.prefix(upTo: index))
            let url = URL(string:path)
            Image.kf.setImage(with: url)
            brandName.text = brand.name
        }
    }
    var category:Category?{
        didSet{
            guard let cat = category else{return}
            brandName.text = cat.name
            let url = URL(string: cat.photo.path)
            Image.kf.setImage(with: url)
        }
    }
    lazy var imageContainer:UIView = {
        let v = UIView()
        v.addSubview(Image)
        v.setShadow(shadowColor: #colorLiteral(red: 0.4352941176, green: 0.4352941176, blue: 0.4352941176, alpha: 0.3), shadowOffset: CGSize(width: 0, height: 1), shadowOpacity: 1, shadowRaduis: 4)

        return v
    }()
    lazy var Image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "XSMax")
        img.contentMode = .scaleAspectFill
        img.layer.cornerRadius = 5
        img.clipsToBounds = true
        return img
    }()
    lazy var brandName: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Medium", size: 12)
        lbl.text = "Apple"
        lbl.textColor = .black
        lbl.textAlignment = .center
        return lbl
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    func  setup() {
        contentView.addSubview(imageContainer)
        contentView.addSubview(brandName)
        addConstraints()
    }
    func addConstraints() {
        imageContainer.anchor(top: contentView.topAnchor, left: nil, bottom: nil, right: nil, centerX: contentView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 110, height: 110, paddingCenterX: 0, paddingCenterY: 0)
        Image.anchor(top: imageContainer.topAnchor, left: imageContainer.leftAnchor, bottom: imageContainer.bottomAnchor, right: imageContainer.rightAnchor, centerX: nil, centerY: nil, paddingTop: 5, paddingLeft: 5, paddingBottom: 5, paddingRight: 5, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        brandName.anchor(top: imageContainer.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: contentView.centerXAnchor, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 45, height: 16, paddingCenterX: 0, paddingCenterY: 0)
    }
}
