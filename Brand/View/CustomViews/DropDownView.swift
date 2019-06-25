//
//  DropDownView.swift
//  DropdownList
//
//  Created by Eslam Dweeb on 2/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
protocol vcProtocol {
    func getIndexPath(indexPath:IndexPath)
}
class DropDownView: UIView,UITableViewDelegate,UITableViewDataSource {
    var dropDownOptions = [[String:Any]]()
    var cellBGC: UIColor?
    var delegate: dropDwonProtocol?
    var vcDelegate: vcProtocol?
    var indexPath:IndexPath?
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.layer.cornerRadius = 5
        table.delegate = self
        table.dataSource = self
        table.translatesAutoresizingMaskIntoConstraints = false
        
        return table
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.layer.cornerRadius = 5
        indexPath = IndexPath(row: 0, section: 0)
        addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        tableView.leftAnchor.constraint(equalTo: self.leftAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        tableView.rightAnchor.constraint(equalTo: self.rightAnchor).isActive = true
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dropDownOptions.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = dropDownOptions[indexPath.row]["name"]as? String
        cell.backgroundColor = cellBGC ?? .clear
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.indexPath = indexPath
        tableView.reloadData()
        self.vcDelegate?.getIndexPath(indexPath: self.indexPath!)
        self.delegate?.dropDownPressed(string: (dropDownOptions[indexPath.row]["name"] as? String)!)
        
    }
}
