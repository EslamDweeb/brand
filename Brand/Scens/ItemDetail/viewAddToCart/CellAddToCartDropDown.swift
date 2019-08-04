//
//  CellAddToCartDropDown.swift
//  Brand
//
//  Created by iOS on 8/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class CellAddToCartDropDown : UITableViewCell {
    
    lazy var dropDownBtn : DropDownBtn = {
        let d = DropDownBtn()
        d.setTitleColor(.black, for: .normal)
        d.setImage(#imageLiteral(resourceName: "down - anticon"), for: .normal)
        d.dropView.backgroundColor = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        d.dropView.cellBGC = #colorLiteral(red: 0.9843137255, green: 0.9803921569, blue: 0.9803921569, alpha: 1)
        d.setTitle("select_gender".localized, for: .normal)
        d.setTitleColor(.lightgray3, for: .normal)
        d.dropView.dropDownOptions = [["name":"Male".localized],["name":"Female".localized]]
        return d
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier )
        setupViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func setupViews () {
        self.selectionStyle = .none
        self.contentView.addSubview(dropDownBtn)
        dropDownBtn.anchor(top: self.contentView.topAnchor , left: self.contentView.leftAnchor , bottom: self.contentView.bottomAnchor , right: self.contentView.rightAnchor , centerX: nil , centerY: nil , paddingTop: 4, paddingLeft: 0, paddingBottom: 4 , paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
}
