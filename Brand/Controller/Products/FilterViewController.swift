//
//  FilterViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FilterViewController:UIViewController,ButtonActionDelegate {
    
    lazy var mainView:SearchFilterView = {
        let v = SearchFilterView(delegate: self)
        return v
    }()
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
}
