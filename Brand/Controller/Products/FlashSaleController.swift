//
//  FlashSaleController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/20/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FlashSaleController: UIViewController {
    lazy var mainView: FlashSaleView = {
        let v = FlashSaleView(delegate: self, dataSource: self)
        v.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        return v
    }()
    let cellID = "cellId"
    
    var flashes:[FlashSale] = [
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "50%", time: "12 PM", quant: 3),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "20%", time: "12 PM", quant: 3),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "50%", time: "12 PM", quant: 3),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "30%", time: "12 PM", quant: 3),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "20%", time: "12 PM", quant: 0),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "40%", time: "12 PM", quant: 3),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "60%", time: "12 PM", quant: 3),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "80%", time: "12 PM", quant: 0),
        FlashSale(image: #imageLiteral(resourceName: "XSMax"), productName: "Iphone Xs Max - Ahmed Magdy", discountVal: "10%", time: "12 PM", quant: 3)
    ]
    
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
