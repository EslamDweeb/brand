//
//  searchFilterVC.swift
//  Brand
//
//  Created by nada dyaa on 8/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
//
//  SecurityVC.swift
//  Al_Ula
//
//  Created by nada dyaa on 4/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit
class searchFilterVC :UIViewController ,ButtonActionDelegate{
    
    lazy var Mainview: SearchFilterView = {
        let view = SearchFilterView(delegate: self)
        return view
    }()
  
    override func loadView() {
        super.loadView()
        view = Mainview
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
   
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    func saveButtonTapped() {
      
    }
}
