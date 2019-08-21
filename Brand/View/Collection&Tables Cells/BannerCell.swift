//
//  BannerCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Kingfisher

class BannerCell:UICollectionViewCell {
    var banner:Banner? {
        didSet{
            guard let ban = banner else{return}
            let url = URL(string: ban.photos.path)
            bannerImage.kf.setImage(with: url)
        }
    }
    var photo:Media? {
        didSet{
            guard let ph = photo else{return}
            let url = URL(string: ph.path)
            bannerImage.kf.setImage(with: url)
        }
    }
    lazy var bannerImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "ads")
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
        fatalError("init(coder:) has not been implemented")
    }
    private func setup() {
        addSubview(bannerImage)
        self.backgroundColor = .clear
        bannerImage.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
