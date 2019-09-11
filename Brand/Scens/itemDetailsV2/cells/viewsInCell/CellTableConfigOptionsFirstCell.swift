//
//  CellTableConfigOptionsFirstCell.swift
//  Brand
//
//  Created by iOS on 9/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

protocol DelegateCellTableConfigOptionsFirstCell : class  {
    func selectedConfigOptions (configOptions : ConfigOption )
}

class CellTableConfigOptionsFirstCell : UITableViewCell {
    
    private var configOption : ConfigOption?
    private var heightCollection : NSLayoutConstraint?
    
    weak var delegate : DelegateCellTableConfigOptionsFirstCell?
    
    lazy var labelTitle : UILabel = {
       let l = UILabel()
        l.font = UIFont(name: "Avenir-Medium", size: 15 )
        return l
    }()
    
    lazy var collectionViewOptions : UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 8
        layout.minimumInteritemSpacing = 8
        layout.sectionInset = UIEdgeInsets(top: 0, left: 12, bottom: 0, right: 12)
        let c = UICollectionView(frame: .zero , collectionViewLayout: layout)
        c.backgroundColor = .white
        c.allowsSelection = true
        c.allowsMultipleSelection = false
        c.register(TagsCell.self , forCellWithReuseIdentifier: TagsCell.getIdentifier() )
        c.delegate = self
        c.dataSource = self
        return c
        
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier)
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
        self.contentView.addSubview( labelTitle )
        self.contentView.addSubview( collectionViewOptions )
        labelTitle.anchor(top: self.contentView.topAnchor , leading: self.contentView.leadingAnchor , paddingTop: 8 , paddingLeft: 16 )
        collectionViewOptions.anchor(top: labelTitle.bottomAnchor , leading: self.contentView.leadingAnchor , bottom: self.contentView.bottomAnchor , trailing: self.contentView.trailingAnchor , paddingTop: 8 , paddingLeft: 8, paddingBottom: 8, paddingRight: 8 )
        heightCollection = collectionViewOptions.heightAnchor.constraint(equalToConstant: 40 )
        heightCollection?.isActive = true
        
    }
    func setData( configOption : ConfigOption ) {
        self.configOption = configOption
        labelTitle.text = self.configOption?.name ?? ""
        collectionViewOptions.reloadData()
    }
    
    
    
    
}

extension CellTableConfigOptionsFirstCell : UICollectionViewDelegate , UICollectionViewDataSource , UICollectionViewDelegateFlowLayout  {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configOption?.values.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TagsCell.getIdentifier() , for: indexPath) as! TagsCell
        let value = configOption?.values[indexPath.row]
        cell.configOptionValue = value
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let text = configOption?.values[indexPath.row].value ?? ""
        let font = UIFont(name: "Avenir-Medium", size: 12)
        let fontAttributes : [NSAttributedString.Key : Any] = [NSAttributedString.Key.font: font ?? UIFont.systemFont(ofSize: 12 )]
        let size = (text as NSString ).size(withAttributes: fontAttributes)
        return CGSize(width: size.width + 32 , height: size.height + 16 )
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        var value = configOption?.values[indexPath.row]
        print("did select : \(value?.value ?? "" )")
        if !(value?.selected ?? true ) {
            if let  indexSelected = configOption?.values.firstIndex(where: {$0.selected == true }) {
                var f = configOption?.values.filter({$0.selected == true }).first
                f?.selected = false
                value?.selected = true
                
                configOption?.values.remove(at: indexSelected )
                configOption?.values.insert( f! , at: indexSelected )
                
                configOption?.values.remove(at: indexPath.row )
                configOption?.values.insert(value!, at: indexPath.row )
                collectionView.reloadData()
                delegate?.selectedConfigOptions(configOptions: configOption! )
            }
            
        }
    }
    
    
}
