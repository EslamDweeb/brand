//
//  OrderViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class OrderViewController: UIViewController,ButtonActionDelegate {
    lazy var mainView: OrderView = {
        let v = OrderView(delegate: self, dataSource: self,actionDelegate: self)
        v.backgroundColor = UIColor.backgroundColl
        return v
    }()
    let cellID = "cellID"
  var orders: [Order] = [
Order(orderNumberVal: "12345", dateVal: "22-4-2019", totalVal: "400 SAR", statusVal: "Pending"),
Order(orderNumberVal: "12345", dateVal: "22-4-2019", totalVal: "400 SAR", statusVal: "Pending"),
Order(orderNumberVal: "12345", dateVal: "22-4-2019", totalVal: "400 SAR", statusVal: "Pending"),
Order(orderNumberVal: "12345", dateVal: "22-4-2019", totalVal: "400 SAR", statusVal: "Pending"),
Order(orderNumberVal: "12345", dateVal: "22-4-2019", totalVal: "400 SAR", statusVal: "Pending")
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
