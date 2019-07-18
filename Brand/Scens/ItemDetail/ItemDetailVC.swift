//
//  ItemDetailVC.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController {

    let viewheader = CustomTabBar()
    let detailview = DetailView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = .white
//        viewheader.backgroundColor = .blue
        self.view.addSubview(viewheader)
        self.view.addSubview(detailview)
        viewheader.anchor(top: nil, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, centerX: self.view.centerXAnchor, centerY:self.view.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 50, paddingCenterX: 0, paddingCenterY: 0)
        detailview.anchor(top: viewheader.bottomAnchor, left: self.view.leftAnchor, bottom: nil, right: self.view.rightAnchor, centerX: self.view.centerXAnchor, centerY:nil, paddingTop: 8, paddingLeft: 20, paddingBottom: 0, paddingRight: 20, width: 0, height: 150, paddingCenterX: 0, paddingCenterY: 0)
    }
}
