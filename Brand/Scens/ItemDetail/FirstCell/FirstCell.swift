//
//  ItemDetailCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/21/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FirstCell:UICollectionViewCell{
    let cellID = "cellID"
    var selectedDec = [String:Int]()
    var selectedIndex = [Int]()

    var configOptionArray:[ConfigOption]? {
        didSet{
            guard let optionsArray = configOptionArray else{return}
            for options in optionsArray{
                for option in options.values{
                    if option.selected! {
                        selectedDec.updateValue(option.id, forKey: options.name)
                    }
                }
            }
        }
    }
    let detailView = DetailView()
    let descriptionView = DescriptionView()
    let footerView = FooterView()
    var detailViewHeightConstraint:NSLayoutConstraint?
    var configOptionTableViewHeightConstraint:NSLayoutConstraint?
    var footerViewHeightConstraint:NSLayoutConstraint?
    lazy var configOptionTableView:UITableView = {
        let table = UITableView()
        table.isScrollEnabled = false
        table.register(ConfigOptionTableCell.self, forCellReuseIdentifier: cellID)
        table.separatorStyle = .none
        table.delegate = self
        table.dataSource = self
        return table
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupViews(){
        addSubViews()
        addConstraintstoViews()
    }
    private func addSubViews(){
        addSubview(detailView)
        addSubview(descriptionView)
        addSubview(configOptionTableView)
        addSubview(footerView)
        self.backgroundColor = .white
    }
    private func addConstraintstoViews(){
        detailView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        detailViewHeightConstraint = detailView.heightAnchor.constraint(equalToConstant: 40)
        detailViewHeightConstraint?.isActive = true
        descriptionView.anchor(top: detailView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 120, paddingCenterX: 0, paddingCenterY: 0)
        configOptionTableView.anchor(top: descriptionView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        configOptionTableViewHeightConstraint = configOptionTableView.heightAnchor.constraint(equalToConstant: 20)
        configOptionTableViewHeightConstraint?.isActive = true
        footerView.anchor(top: configOptionTableView.bottomAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        footerViewHeightConstraint = footerView.heightAnchor.constraint(equalToConstant: 10)
        footerViewHeightConstraint?.isActive = true
    }
    func getDetailViewData(brandName name:String,madeIN:String,tags:[Tag]){
        detailView.branTitle = name
        detailView.contryTitle = madeIN
        detailView.tags = tags
        detailView.tagsCollection.reloadData()
        detailView.setLableTitles()
        if name != "" {
            detailView.brandNameHeight?.constant = 20
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
        if tags.count != 0 {
            detailViewHeightConstraint?.constant = 80
            detailView.TagsCollHeight?.constant = 40
            UIView.animate(withDuration: 0.1) {
                 self.layoutIfNeeded()
            }
        }
    }
    func getDescriptionViewData(description:String){
        descriptionView.descripLbl.text = description
    }
    func getFooterViewData(configs:[Config]){
        footerView.configs = configs
        footerView.productCollectionView.reloadData()
        if configs.count != 0{
            footerView.titleLbl.isHidden = false
            footerViewHeightConstraint?.constant = 220
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }else{
            footerViewHeightConstraint?.constant = 0
            footerView.titleLbl.isHidden = true
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
    }
}
extension FirstCell:UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return configOptionArray?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)as? ConfigOptionTableCell else {return UITableViewCell()}
        cell.ConnectDelegate = self
        cell.configOption = configOptionArray?[indexPath.row]
        cell.configValueCollection.reloadData()
        return cell
    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if configOptionArray?.count ?? 0 == 0 {
            configOptionTableViewHeightConstraint?.constant = 0
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }else{
            configOptionTableViewHeightConstraint?.constant = tableView.contentSize.height + 8
            UIView.animate(withDuration: 0.1) {
                self.layoutIfNeeded()
            }
        }
    }
}
extension FirstCell:ConnectConfigTabelCellToFirstCellDelegate{
    func getSelectedOption(dice:[String:Int]) {
        for (key,value) in dice{
            self.selectedDec.updateValue(value, forKey: key)
        }
        for val in selectedDec.values {
            selectedIndex.append(val)
        }
        print(dice)
        print(self.selectedDec)
        print(self.selectedIndex)
    }
}
protocol ConnectConfigTabelCellToFirstCellDelegate:class{
    func getSelectedOption(dice:[String:Int])
}
extension ConnectConfigTabelCellToFirstCellDelegate{
    func getSelectedOption(dice:[String:Int]) {
        
    }
}
