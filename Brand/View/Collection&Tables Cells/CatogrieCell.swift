//
//  ExploreCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Kingfisher

class CatogrieCell:UICollectionViewCell {
    var category:Category?{
        didSet{
            guard let cat = category else{return}
            brandName.text = cat.name
            let url = URL(string: cat.photo?.path ?? "")
            Image.kf.setImage(with: url)
        }
    }
    var brand:Brand? {
        didSet{
            guard let brand = brand else {return}
            let index = brand.logoImage.path.firstIndex(of: " ")
            let path = String(brand.logoImage.path.prefix(upTo: index!))
            let url = URL(string:path)
            Image.kf.setImage(with: url)
            brandName.text = brand.name
        }
    }
    lazy var Image: UIImageView = {
        let img = UIImageView()
        img.image = #imageLiteral(resourceName: "XSMax")
        img.contentMode = .scaleToFill
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
        contentView.addSubview(Image)
        contentView.addSubview(brandName)
        addConstraints()
    }
    func addConstraints() {
        Image.anchor(top: contentView.topAnchor, left: nil, bottom: nil, right: nil, centerX: contentView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
          brandName.anchor(top: Image.bottomAnchor, left: nil, bottom: nil, right: nil, centerX: contentView.centerXAnchor, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 45, height: 16, paddingCenterX: 0, paddingCenterY: 0)
    }
}
