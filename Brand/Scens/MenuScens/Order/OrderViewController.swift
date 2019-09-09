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
    var shouldShowLoadingCell = false
    var currentPage:Int = 1
    var lastPage:Int?
    let reachability =  Reachability()
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
        handelReachability(reachability: reachability)
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        ordersPending.removeAll()
        ordersOthers.removeAll()
        ordersDelivered.removeAll()
        currentPage = 1
        mainView.orderCollection.backgroundView = nil
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getOrders(true)
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
    private func getOrders(_ refresh:Bool = false){
       
        mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        APIClient.getOrders(page: currentPage) { (result) in
            switch result {
            case.success(let data):
//                if refresh {
//                    self.orders = data.orders ?? []
//                } else {
//                    for conf in data.orders  ?? []{
//                        self.orders.append(conf)
//                    }
//                }
                for i in data.orders ?? [] {
                    if i.status.id == 1 ||  i.status.id == 2 || i.status.id == 3 {
                        self.ordersPending.append(i)
                    }else if i.status.id == 4 {
                        self.ordersDelivered.append(i)
                    }else {
                        self.ordersOthers.append(i)
                    }
                }
                DispatchQueue.main.async {
                    self.mainView.activityStopAnimating()
                    self.shouldShowLoadingCell = (data.meta!.currentPage ?? 0) < (data.meta!.lastPage ?? 0)
                    self.mainView.orderCollection.reloadData()
                }
            case .failure(let error):
                self.mainView.activityStopAnimating()
                print(error)
            }
        }
    }//MARK:- Paging Functions
    func fetchNextPage() {
        currentPage += 1
        getOrders()
    }
}
