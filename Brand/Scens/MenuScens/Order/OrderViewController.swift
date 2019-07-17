//
//  OrderViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class OrderViewController: UIViewController,ButtonActionDelegate {
    lazy var mainView: OrderView = {
        let v = OrderView(delegate: self, dataSource: self,actionDelegate: self)
        v.backgroundColor = UIColor.backgroundColl
        return v
    }()
    let cellID = "cellID"
    var orders: [SimpleOrder] = []
    var ordersPending: [SimpleOrder] = []
    var ordersDelivered: [SimpleOrder] = []
    var ordersOthers: [SimpleOrder] = []
    
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
    func getPendingTapped() {
      if MOLHLanguage.currentAppleLanguage() == "en" {
        self.mainView.line1.isHidden = false
         self.mainView.line2.isHidden = true
        self.mainView.line3.isHidden = true
      }
      else{
        self.mainView.line1.isHidden = true
        self.mainView.line2.isHidden = true
        self.mainView.line3.isHidden = false
        
        }
        self.mainView.orderCollection.reloadData()
        
    }
    func getOtherTapped() {
         if MOLHLanguage.currentAppleLanguage() == "en" {
        self.mainView.line1.isHidden = true
        self.mainView.line2.isHidden = true
        self.mainView.line3.isHidden = false
            
         }else{
            self.mainView.line1.isHidden = false
            self.mainView.line2.isHidden = true
            self.mainView.line3.isHidden = true
        }
        self.mainView.orderCollection.reloadData()
    }
    func getDeliveredTapped() {
        self.mainView.line1.isHidden = true
        self.mainView.line2.isHidden = false
        self.mainView.line3.isHidden = true
        self.mainView.orderCollection.reloadData()
    }
    private func getOrders(){
        mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        APIClient.getOrders { (result) in
            switch result {
            case.success(let data):
                self.orders = data.orders
                for i in self.orders {
                    if i.status.id == 1 ||  i.status.id == 2 || i.status.id == 3 {
                       self.ordersPending.append(i)
                    }else if i.status.id == 4 {
                        self.ordersDelivered.append(i)
                    }else {
                        self.ordersOthers.append(i)
                    }
                }
                self.mainView.orderCollection.reloadData()
                self.mainView.activityStopAnimating()
            case.failure(let error):
                self.mainView.activityStopAnimating()
                print(error)
            }
        }
    }
}
