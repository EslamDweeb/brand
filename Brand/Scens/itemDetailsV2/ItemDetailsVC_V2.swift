//
//  ItemDetailsV2.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ItemDetailsVC_V2 : UIViewController {
    
    lazy var mainView : ItemDetailsView_V2 = {
       let v = ItemDetailsView_V2()
        
        return v
    }()
    
    var slug = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
    
}
