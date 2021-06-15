//
//  ExploreCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
class ExploreCell:UICollectionViewCell {
    let cellID = "CellID"
    var configArray = [DetailedConfig]()
    var handelSeeAll: (() ->())?
    var handelFavTapped:((_ id:Int)->Void)?
    var handelCartTapped:((_ config:DetailedConfig)->Void)?
    lazy var titleLabel:UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.textAlignment = .left
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var seeall:UIButton = {
        let btn = UIButton()
        btn.setTitle("seeAll".localized, for: .normal)
        btn.setTitleColor(.pink, for: .normal)
        btn.addTarget(self, action: #selector(handelSeeAllBtnTapped), for: .touchUpInside)
        return btn
    }()
    @objc func handelSeeAllBtnTapped(){
        self.handelSeeAll?()
    }
    lazy var productCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(WishCell.self, forCellWithReuseIdentifier: cellID)
        collection.backgroundColor = .clear
        collection.showsHorizontalScrollIndicator = false
        return collection
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        productCollectionView.delegate = self
        productCollectionView.dataSource = self
        setup()
    }
    weak var delegate:ExploreCellDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setup(){
        addSubview(titleLabel)
        addSubview(productCollectionView)
        addSubview(seeall)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            titleLabel.textAlignment = .left
            titleLabel.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            seeall.anchor(top: topAnchor, left: nil, bottom: nil, right:rightAnchor, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 60, height: 20, paddingCenterX: 0, paddingCenterY: 0)
          
        }else{
            titleLabel.textAlignment = .right
            titleLabel.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            seeall.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right:nil, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 60, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }
        
        productCollectionView.anchor(top: titleLabel.bottomAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
extension ExploreCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
       return configArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? WishCell else{return UICollectionViewCell()}
        cell.config = configArray[indexPath.item]
        cell.handelFavBtnTapped = {[weak self] (id) in
            guard let self = self else{return}
            self .handelFavTapped?(id)
        }
        cell.handelCartBtnTappedClouser = {[weak self] (config) in
            guard let self = self else{return}
          //  print("config is not nil : \(config)")
            self.delegate?.handelCartBtnTapped(config: config)
        }
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 160 , height: 210)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? WishCell else{return}
        delegate?.presentController(slug: cell.config?.slug ?? "")
    }
}
