//
//  FooterView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FooterView:UIView{
    let cellID = "cellID"
    var configs:[Config]?
    lazy var titleLbl:UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: .fontH, size: 16)
        lbl.text = NSLocalizedString("relatedProduct", comment: "")
        return lbl
    }()
    lazy var seeall:UIButton = {
        let lbl = UIButton()
        lbl.setTitle(NSLocalizedString("seeAll", comment: ""), for: .normal)
        lbl.setTitleColor(.pink, for: .normal)
        return lbl
    }()
    lazy var productCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(WishCell.self, forCellWithReuseIdentifier: cellID)
        collection.backgroundColor = .clear
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
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
        addSubview(titleLbl)
        addSubview(seeall)
        addSubview(productCollectionView)
    }
    private func addConstraintsToViews() {
        titleLbl.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right:nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        seeall.anchor(top: topAnchor, left: nil, bottom: nil, right:rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 16, width: 60, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        productCollectionView.anchor(top: titleLbl.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 300, paddingCenterX: 0, paddingCenterY: 0)
    }
}
extension FooterView:UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UICollectionViewDataSource{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configs?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)as?WishCell else{return UICollectionViewCell()}
        cell.config = configs?[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: 160 , height: 210)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 8
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
}
