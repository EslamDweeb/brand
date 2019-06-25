//
//  OrderCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class OrderCell:UICollectionViewCell {
    
    var order:Order? {
        didSet{
            guard let order = order else{return}
            orderNumberVal.text = order.orderNumberVal
            dateVal.text = order.dateVal
            totlaVal.text = order.totalVal
            statusVal.text = order.statusVal
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
    lazy var orderNumber: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        lbl.text = "Order number"
        lbl.textColor = .black
        return lbl
    }()
    lazy var date: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
           lbl.text = "Date"
        lbl.textColor = .black
        return lbl
    }()
    lazy var totla: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        lbl.text = "Total"
        lbl.textColor = .black
        return lbl
    }()
    lazy var status: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 14)
        lbl.text = "Status"
        lbl.textColor = .black
        return lbl
    }()
    lazy var orderNumberVal: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 12)
        lbl.textColor = .lightgray
        return lbl
    }()
    lazy var dateVal: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 12)
        lbl.textColor = .lightgray
        return lbl
    }()
    lazy var totlaVal: UILabel = {
        let lbl = UILabel()
        lbl.font = UIFont(name: "Avenir-Heavy", size: 12)
        lbl.textColor = .lightgray
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
        orderNumber.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
             date.anchor(top: orderNumber.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
             totla.anchor(top: date.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
             status.anchor(top: totla.bottomAnchor, left: containerView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 100, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        orderNumberVal.anchor(top: containerView.topAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        dateVal.anchor(top: orderNumberVal.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        totlaVal.anchor(top: dateVal.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        statusVal.anchor(top: totlaVal.bottomAnchor, left: nil, bottom: nil, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 80, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        
        containerView.setShadow(shadowColor: UIColor(red: 0, green: 0, blue: 0, alpha:0.24).cgColor, shadowOffset: CGSize(width: containerView.frame.width, height: containerView.frame.height), shadowOpacity: 0.6 , shadowRaduis: 2)
    }
}
