//
//  AddReviewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class AddReviewController:UIViewController,ButtonActionDelegate {
    
    lazy var mainView: AddReviewView = {
        let v = AddReviewView(delegate: self)
        v.backgroundColor = UIColor.backgroundColl
        return v
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
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
