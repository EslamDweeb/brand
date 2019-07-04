//
//  DetailOrderController.swift
//  Brands
//
//  Created by nada dyaa on 3/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class DetailorderVC : UIViewController ,ButtonActionDelegate{
    var mainView = DetailorderView()
    let reachability =  Reachability()
    var orderSerial:String?
    var pro: [Item] = []
    var itemDetail =  [ NSLocalizedString("orderNumber", comment: ""):"data.order.referenceNumber",
                        NSLocalizedString("orderDate", comment: ""):" data.order.createdAt.date"
    ]
    var x = 0
    var y = 0
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        getOrderDetail()
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.actionDelegete = self
    }
    
    func saveButtonTapped() {
        
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func getOrderDetail(){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
            APIClient.getOrdersDetails(orderSerial: self.orderSerial ?? "") { (result) in
                switch result{
                case.success(let data):
                    print(data)
                    DispatchQueue.main.async {
                        self.mainView.order = data.order
                        self.pro = data.order.items ?? []
                        self.itemDetail [ NSLocalizedString("orderNumber", comment: "")] = data.order.referenceNumber
                        self.itemDetail[NSLocalizedString("orderDate", comment: "")] = data.order.createdAt.date
                        self.createItemDetailView()
                        self.CreateOrderDetailView()
                        self.mainView.activityStopAnimating()
                    }
                case.failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            }
        }
    }
    private func createItemDetailView(){
        print(pro)
        for i in self.pro {
            let addview : productCheckout = {
                let view = productCheckout()
                view.namelabel.text = i.name
                view.Qlabel.text  = "\(i.qty)"
                view.Pricelabel.text  = "\(i.unitOverallPrice)"
                return view
            }()
            self.mainView.orderitemsview.addSubview(addview)
            
            addview.anchor(top: self.mainView.orderitemsview.topAnchor, left: self.mainView.orderitemsview.leftAnchor, bottom: nil, right: self.mainView.orderitemsview.rightAnchor, centerX: nil, centerY: nil, paddingTop: CGFloat(72 + self.x), paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            self.x += 25
            
        }
        self.mainView.orderitemsview.heightAnchor.constraint(equalToConstant: CGFloat(75 + self.x)).isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
    }
    private func CreateOrderDetailView(){
        for (key,val) in self.itemDetail {
            let addview : OrderDetailsView = {
                let view = OrderDetailsView()
                view.namelabel.text = key
                view.Pricelabel.text  = "\(val)"
                return view
            }()
            self.mainView.detailsorderView.addSubview(addview)
            
            addview.anchor(top: self.mainView.detailsorderView.topAnchor, left: self.mainView.detailsorderView.leftAnchor, bottom: nil, right: self.mainView.detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: CGFloat(40 + self.y), paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            self.y += 25
            
        }
        self.mainView.detailsorderView.heightAnchor.constraint(equalToConstant: CGFloat(76 + self.y)).isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
    }
}
