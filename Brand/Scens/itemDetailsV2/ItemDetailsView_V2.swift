//
//  ItemDetailsView_V2.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ItemDetailsView_V2 : UIView {
    
    
    lazy var collectionViewMain : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        layout.scrollDirection = .horizontal
        
       let c = UICollectionView(frame: .zero , collectionViewLayout: layout )
        c.delegate = self
        c.dataSource = self
        c.isPagingEnabled = true
        c.register(CellItemDetailsFirstTab.self , forCellWithReuseIdentifier: CellItemDetailsFirstTab.getIdentifier())
        c.register(SecondeCell.self , forCellWithReuseIdentifier: SecondeCell.getIdentifier() )
        c.register(ThirdCell.self , forCellWithReuseIdentifier: ThirdCell.getIdentifier())
       return c
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
       self.addSubview(collectionViewMain)
       collectionViewMain.anchor(top: self.topAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor , trailing: self.trailingAnchor )
    }
    
    
    
    
}

extension ItemDetailsView_V2 : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if indexPath.row == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CellItemDetailsFirstTab.getIdentifier() , for: indexPath) as! CellItemDetailsFirstTab
            return cell
        }else if indexPath.row == 1 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SecondeCell.getIdentifier() , for: indexPath) as! SecondeCell
            cell.specs = []
            return cell
        }else if indexPath.row == 2 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ThirdCell.getIdentifier() , for: indexPath) as! ThirdCell
            return cell
        }
        return UICollectionViewCell()
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionViewMain.frame.width , height: self.collectionViewMain.frame.height)
    }
    
    
    
    
}
