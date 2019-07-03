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
    var orders: [SimpleOrder] = []
    
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getOrders()
    }
    private func getOrders(){
        mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        APIClient.getOrders { (result) in
            switch result {
            case.success(let data):
                self.orders = data.orders
                self.mainView.orderCollection.reloadData()
                self.mainView.activityStopAnimating()
            case.failure(let error):
                self.mainView.activityStopAnimating()
                print(error)
            }
        }
    }
}
