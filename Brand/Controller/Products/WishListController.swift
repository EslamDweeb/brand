//
//  WishListController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class WishListController: UIViewController,ButtonActionDelegate {
    lazy var mainView: WishListView = {
        let v = WishListView(delegate: self, dataSource: self)
        v.backgroundColor = .white
        return v
    }()
    let cellID = "cellID"
    var wishes: [Wishes] = [
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR"),
//        Wishes(image: #imageLiteral(resourceName: "XSMax"), brandName: "Apple", productName: "iPhone XS Mas all colors 64 GB 4G LTE", price: "3,199 SAR", disountVal: "31%", discountPrice: "3,199 SAR")
        
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
}
