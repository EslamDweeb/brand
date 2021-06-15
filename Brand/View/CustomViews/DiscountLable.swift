//
//  DiscountLable.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class DiscountLable: UILabel {
    var edgeInsets:UIEdgeInsets?
    var topPadding:CGFloat = 4
    var leftPadding:CGFloat = 8
    var bottomPadding:CGFloat = 4
    var rightPadding:CGFloat = 8
    
    override func layoutSubviews() {
        super.layoutSubviews()
        setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
       setup()
    }
    private func setup() {
        font = UIFont(name: "Avenir-Heavy", size: 13)
        self.textColor = .white
        self.textAlignment = .center
        self.backgroundColor = .pink
        self.roundCorners(.allCorners, radius: 5)
    }
    override func drawText(in rect: CGRect) {
        edgeInsets = UIEdgeInsets(top: topPadding, left: leftPadding, bottom: bottomPadding, right: rightPadding)
        super.drawText(in: rect.inset(by: edgeInsets!))
    }
    override var intrinsicContentSize: CGSize {
        let size = super.intrinsicContentSize
        return CGSize(width: size.width + leftPadding + rightPadding,
                      height: size.height + topPadding + bottomPadding)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
