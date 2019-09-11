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
        c.isPagingEnabled = true
        c.register(CellItemDetailsFirstTab.self , forCellWithReuseIdentifier: CellItemDetailsFirstTab.getIdentifier())
        c.register(SecondeCell.self , forCellWithReuseIdentifier: SecondeCell.getIdentifier() )
        c.register(ThirdCell.self , forCellWithReuseIdentifier: ThirdCell.getIdentifier())
        return c
    }()

    
    lazy var headerView : HeaderViewItemDetails = {
        let v = HeaderViewItemDetails( buttonActionDelegate! )
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    var buttonActionDelegate : ButtonActionDelegate?
    
    init(delegate : UICollectionViewDelegate , dataSource : UICollectionViewDataSource , buttonActionDelegate : ButtonActionDelegate) {
        super.init(frame: .zero )
        self.collectionViewMain.delegate = delegate
        self.collectionViewMain.dataSource = dataSource
        self.buttonActionDelegate = buttonActionDelegate
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    private func initViews () {
        self.backgroundColor = .white
        addViews()
    }
    
    private func addViews () {
        self.addSubview(collectionViewMain)
        self.addSubview(headerView)
        
        headerView.anchor(top: self.topAnchor , leading: self.leadingAnchor  , trailing: self.trailingAnchor  )
        
        collectionViewMain.anchor(top: headerView.bottomAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor , trailing: self.trailingAnchor )
    }
    
    
    
    
}



