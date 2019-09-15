//
//  SecondTabItemDetials.swift
//  Brand
//
//  Created by iOS on 9/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SecondTabItemDetials : UITableView {
    
    var specs:[Spec]?
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame , style: style )
        initTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initTableView()
    }
    
    private func initTableView() {
        self.register(SpecTAbleCell.self , forCellReuseIdentifier: SpecTAbleCell.getIdentifier())
        self.allowsSelection = false
        self.separatorStyle = .none
        self.backgroundColor = .white
        self.delegate = self
        self.dataSource = self
        self.isScrollEnabled = false
        
    }
    
    
}

extension SecondTabItemDetials : UITableViewDelegate , UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if specs?.count == 0 {
            let view = MyAddressTableBG()
            view.image.image = #imageLiteral(resourceName: "No product")
            view.lable.text = "No specification"
            view.addbtn.isHidden = true
            view.backgroundColor = .white
            tableView.backgroundView = view
        }else{
            tableView.backgroundView = nil
        }
        return specs?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: SpecTAbleCell.getIdentifier() , for: indexPath) as! SpecTAbleCell
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
