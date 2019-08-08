//
//  CellAddToCartButtonView.swift
//  Brand
//
//  Created by iOS on 8/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class CellAddToCartButtonView : UITableViewCell {
    
    lazy private var viewSelection : UIView = {
        let v = UIView ()
        v.backgroundColor = .grayBackgroundCell
        return v
    }()
    
    lazy private var labelTextInView : UILabel = {
        let l = UILabel ()
        l.font = setFont(name: .fontL, size: 12)
        l.textColor = .grayTextCell
        return l
    }()
    
    var isCellSelected = false {
        didSet {
            if isCellSelected {
                selectItem()
            }else {
                deSelectItem()
            }
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style , reuseIdentifier: reuseIdentifier )
        initViews()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    private func initViews () {
        self.selectionStyle = .none
        viewSelection.addSubview(labelTextInView)
        self.addSubview(viewSelection)
        
        labelTextInView.anchor(top: nil , left: nil , bottom: nil , right: nil , centerX: viewSelection.centerXAnchor , centerY: viewSelection.centerYAnchor , paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        viewSelection.anchor(top: self.topAnchor , left: self.leftAnchor , bottom: self.bottomAnchor , right: self.rightAnchor , centerX: nil , centerY: nil , paddingTop: 4, paddingLeft: 4, paddingBottom: 4, paddingRight: 4, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
    }
    
    func setTextLabel (name : String , price : Int , selected : Bool ) {
        labelTextInView.text = "\(name) ( +\(price) SAR )"
        isCellSelected = selected
    }
    
    
    func selectItem () {
        labelTextInView.textColor = .white
        viewSelection.backgroundColor = .magenta
    }
    
    func deSelectItem () {
        labelTextInView.textColor = .grayTextCell
        viewSelection.backgroundColor = .grayBackgroundCell
    }
    
    
    
}
