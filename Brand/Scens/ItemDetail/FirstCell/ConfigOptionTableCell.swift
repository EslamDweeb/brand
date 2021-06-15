//
//  ConfigOptionTableCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 8/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ConfigOptionTableCell:UITableViewCell {
    let cellID = "cellID"
    weak var ConnectDelegate:ConnectConfigTabelCellToFirstCellDelegate?
    var configOption:ConfigOption?{
        didSet{
            guard let option = configOption else{return}
            titleLable.text = option.name
        }
    }
    lazy var titleLable:UILabel = {
        let lbl = UILabel()
        lbl.text = NSLocalizedString("color", comment: "")
        lbl.font = UIFont(name: .fontH, size: 16)
        return lbl
    }()
    lazy var configValueCollection:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
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
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
    private func addSubViews(){
        addSubview(titleLable)
        addSubview(configValueCollection)
        addSubview(lineView)
    }
    private func addConstraintsToViews(){
        titleLable.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right:nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 16, width: 150, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        configValueCollection.anchor(top: titleLable.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        lineView.anchor(top: configValueCollection.bottomAnchor , left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 4, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
    }
}
extension ConfigOptionTableCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return configOption?.values.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath)as? TagsCell else{return UICollectionViewCell()}
        cell.configOptionValue = configOption?.values[indexPath.row]
      
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
//        guard let cell = collectionView.cellForItem(at: indexPath)as?TagsCell else{return}
//        if cell.cardView.backgroundColor == .pink {
//            cell.cardView.backgroundColor = .lightgray3
//        }else{
//            cell.cardView.backgroundColor = .pink
//        }
        ConnectDelegate?.getSelectedOption(dice: [configOption?.name ?? "":configOption?.values[indexPath.row].id ?? 0])
    }
}
