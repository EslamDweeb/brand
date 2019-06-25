//
//  RoundedImageView.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/11/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class RoundedImageView: UIImageView {
    
    override func layoutSubviews() {
        super.layoutSubviews()
     setup()
    }
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    private func setup() {
    layer.cornerRadius = frame.size.width / 2
      clipsToBounds = true
      isUserInteractionEnabled = true
      contentMode = .scaleAspectFill
      image = #imageLiteral(resourceName: "defaultImage")
    }
}
