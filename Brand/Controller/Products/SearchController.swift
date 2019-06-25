//
//  SearchController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/20/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SearchController: UIViewController,ButtonActionDelegate {
    
    lazy var mainView: SearchView = {
        let v = SearchView(delegate: self, dataSource: self,actionDelegate: self)
        v.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        return v
    }()
    let cellID = "cellID"
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
    func filterBtnTapped() {
        self.presentViewController(controller: FilterViewController(), transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
}
