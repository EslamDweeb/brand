//
//  SecondeCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SecondeCell:UICollectionViewCell{
    var specs:[Spec]?
    let cellID = "cellID"
    lazy var tableView:UITableView = {
        let table = UITableView()
        table.register(SpecTAbleCell.self, forCellReuseIdentifier: cellID)
        table.allowsSelection = false
        table.separatorStyle = .none
        table.backgroundColor = .white
        table.delegate = self
        table.dataSource = self
        table.isScrollEnabled = false
        return table
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(tableView)
        tableView.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 50, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension SecondeCell:UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return specs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? SpecTAbleCell else{return UITableViewCell()}
        if indexPath.row % 2 == 0 {
            cell.backgroundColor = #colorLiteral(red: 0.9647058824, green: 0.9647058824, blue: 0.9647058824, alpha: 1)
        }else{
            cell.backgroundColor = #colorLiteral(red: 0.9215686275, green: 0.9215686275, blue: 0.9215686275, alpha: 1)
        }
        cell.spec = specs?[indexPath.row]
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
}
