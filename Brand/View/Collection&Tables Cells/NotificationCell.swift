//
//  NotificationCell.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class NotificationCell:UITableViewCell {
    
    var string:String?
    lazy var containerView:UIView = {
        let view = UIView()
        view.backgroundColor = .white
        return view
    }()
    lazy var logoImage:UIImageView = {
        let image = UIImageView()
        image.image = #imageLiteral(resourceName: "XSMax")
        image.contentMode = .scaleAspectFill
        return image
    }()
    lazy var messageLable:UILabel = {
        let lable = UILabel()
        lable.font = UIFont(name: "Avenir-Medium", size: 12.0)
        lable.numberOfLines = 0
        lable.lineBreakMode = NSLineBreakMode.byWordWrapping
        lable.sizeToFit()
//        let attributedString = NSMutableAttributedString(string: string ?? "Pink sale for 2 days. Hurry up and get up to 40% off", attributes: [
//            .font: UIFont(name: "Avenir-Medium", size: 12.0)!,
//            .foregroundColor: UIColor(white: 0.0, alpha: 1.0)
//            ])
//        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 250.0 / 255.0, green: 113.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0), range: NSRange(location: 0, length: 9))
//        attributedString.addAttribute(.foregroundColor, value: UIColor(red: 250.0 / 255.0, green: 113.0 / 255.0, blue: 205.0 / 255.0, alpha: 1.0), range: NSRange(location: 45, length: 7))
//        lable.attributedText = attributedString
        return lable
    }()
    lazy var dateLable:UILabel = {
        let date = UILabel()
       // date.text = "Today, 4:47 PM"
        date.textColor = .lightgray2
        date.font = UIFont(name: "Avenir-Medium", size: 10)
        return date
    }()
    lazy var vLineView:UIView = {
        let view = UIView()
        view.isHidden = true
        view.backgroundColor = .pink
        return view
    }()
    lazy var hLineView:UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(red: 215/255, green: 215/255, blue: 215/255, alpha: 0.42)
        return view
    }()
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
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
        containerView.addSubview(logoImage)
        containerView.addSubview(dateLable)
        containerView.addSubview(messageLable)
        containerView.addSubview(vLineView)
        containerView.addSubview(hLineView)
    }
    private  func addConstrainsToUI() {
        containerView.anchor(top: contentView.topAnchor, left: contentView.leftAnchor, bottom: contentView.bottomAnchor, right: contentView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        vLineView.anchor(top: containerView.topAnchor, left: containerView.leftAnchor, bottom: hLineView.topAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 2, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        logoImage.anchor(top: nil, left: vLineView.rightAnchor, bottom: nil, right: nil, centerX: nil, centerY: containerView.centerYAnchor, paddingTop: 8 , paddingLeft: 8, paddingBottom: 8, paddingRight: 0, width: 40, height: 40, paddingCenterX: 0, paddingCenterY: 0)
        messageLable.anchor(top: containerView.topAnchor, left: logoImage.rightAnchor, bottom: dateLable.topAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , paddingRight: 8, width: 0, height: 16, paddingCenterX: 0, paddingCenterY: 0)
        
        dateLable.anchor(top: nil , left: logoImage.rightAnchor, bottom: containerView.bottomAnchor , right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , paddingRight: 8, width: 0, height: 15, paddingCenterX: 0, paddingCenterY: 0)
        hLineView.anchor(top: nil, left: vLineView.rightAnchor, bottom: containerView.bottomAnchor, right: containerView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 1, paddingCenterX: 0, paddingCenterY: 0)
        
    }
    
}
