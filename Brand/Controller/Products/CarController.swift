//
//  CarController.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class CartController : UIViewController ,ButtonActionDelegate{
var cartv = CartView()

    var cartpro: [Cart] = [
        
        Cart(image: #imageLiteral(resourceName: "iphonexsFamily"), productName: "Oppo realme 2 Pro 128 GB 4G - Blue", brandName: "oppo", priceSAR: "3900 SAR", lastprice: "2100 SAR", QTY: "QTY : 2pcs", DisCount: "31%", outStack: true),
         Cart(image: #imageLiteral(resourceName: "XSMax"), productName: "Oppo realme 2 Pro 128 GB 4G - Blue", brandName: "oppo", priceSAR: "3900 SAR", lastprice: "2100 SAR", QTY: "QTY : 2pcs", DisCount: "31%", outStack: false),
          Cart(image: #imageLiteral(resourceName: "iphonexsFamily"), productName: "Oppo realme 2 Pro 128 GB 4G - Blue", brandName: "oppo", priceSAR: "3900 SAR", lastprice: "2100 SAR", QTY: "QTY : 2pcs", DisCount: "31%", outStack: true),
           Cart(image: #imageLiteral(resourceName: "XSMax"), productName: "Oppo realme 2 Pro 128 GB 4G - Blue", brandName: "oppo", priceSAR: "3900 SAR", lastprice: "2100 SAR", QTY: "QTY : 2pcs", DisCount: "31%", outStack: true),
            Cart(image: #imageLiteral(resourceName: "iphonexsFamily"), productName: "Oppo realme 2 Pro 128 GB 4G - Blue", brandName: "oppo", priceSAR: "3900 SAR", lastprice: "2100 SAR", QTY: "QTY : 2pcs", DisCount: "31%", outStack: false)
    ]
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
override func loadView() {
    super.loadView()
    view = cartv
}
override func viewDidLayoutSubviews() {
    super.viewDidLayoutSubviews()
   
}
override func viewDidLoad() {
    super.viewDidLoad()
    
    cartv.actionDelegate = self
    cartv.tableView.delegate = self
    cartv.tableView.dataSource = self
    
}
func saveButtonTapped() {
    
}
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }

}
