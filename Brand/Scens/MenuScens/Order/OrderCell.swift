//
//  OrderCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class OrderCell:UICollectionViewCell {
    
    var order:SimpleOrder? {
        didSet{
            guard let order = order else{return}
            orderNumberVal.text = order.referenceNumber
            dateVal.text = order.createdAt.date
            totlaVal.text = "\(order.totalPrice)"
            statusVal.text = order.status.name
        }
    }
    lazy var containerView:UIView = {
        let view = UIView()
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.backgroundCell.cgColor
        view.backgroundColor = .white
        return view
    }()
    lazy var orderNumber: OrderKeyLable = {
        let lbl = OrderKeyLable()
        lbl.text = NSLocalizedString("orderNumber", comment: "")
        return lbl
    }()
    lazy var date: OrderKeyLable = {
        let lbl = OrderKeyLable()
        lbl.text = NSLocalizedString("orderDate", comment: "")
        return lbl
    }()
    lazy var totla: OrderKeyLable = {
        let lbl = OrderKeyLable()
        lbl.text = NSLocalizedString("totalAmount", comment: "")
        return lbl
    }()
    lazy var status: OrderKeyLable = {
        let lbl = OrderKeyLable()
        lbl.text = NSLocalizedString("orderStatus", comment: "")
        return lbl
    }()
    lazy var orderNumberVal: OrderValueLable = {
        let lbl = OrderValueLable()
        return lbl
    }()
    lazy var dateVal: OrderValueLable = {
        let lbl = OrderValueLable()
        return lbl
    }()
    lazy var totlaVal: OrderValueLable = {
        let lbl = OrderValueLable()
        return lbl
    }()
    lazy var statusVal: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 12)
        lbl.textColor = .pink
        return lbl
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(orderNumber)
        containerView.addSubview(date)
        containerView.addSubview(totla)
        containerView.addSubview(status)
        containerView.addSubview(orderNumberVal)
        containerView.addSubview(dateVal)
        containerView.addSubview(totlaVal)
        containerView.addSubview(statusVal)
    }
    private  func addConstrainsToUI() {
        
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 16, paddingBottom: 0, paddingRight: 16, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        
        if MOLHLanguage.currentAppleLanguage() == "en" {
            
            orderNumber.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            date.anchor(top: orderNumber.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            totla.anchor(top: date.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            status.anchor(top: totla.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            
            orderNumberVal.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            dateVal.anchor(top: orderNumberVal.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            totlaVal.anchor(top: dateVal.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            statusVal.anchor(top: totlaVal.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            orderNumber.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            date.anchor(top: orderNumber.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            totla.anchor(top: date.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
           status.anchor(top: totla.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            
            orderNumberVal.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
             orderNumberVal.widthAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
            dateVal.anchor(top: orderNumberVal.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
             dateVal.widthAnchor.constraint(lessThanOrEqualToConstant: 120).isActive = true
             totlaVal.anchor(top: dateVal.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
             totlaVal.widthAnchor.constraint(lessThanOrEqualToConstant: 140).isActive = true
            statusVal.anchor(top: totlaVal.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            statusVal.widthAnchor.constraint(lessThanOrEqualToConstant: 100).isActive = true
            
            orderNumberVal.textAlignment = .left
            dateVal.textAlignment = .left
            statusVal.textAlignment = .left
            totlaVal.textAlignment = .left
        }
        
        containerView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha:0.24).cgColor, shadowOffset: CGSize(width: containerView.frame.width, height: containerView.frame.height), shadowOpacity: 0.3 , shadowRaduis: 1)
    }
}
