//
//  DetailOrderController.swift
//  Brands
//
//  Created by nada dyaa on 3/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class DetailorderVC : UIViewController ,ButtonActionDelegate{
    var OrderDetailsview = DetailorderView()
    let reachability =  Reachability()
    var orderSerial:String?
    var pro: [procheck] = [
        procheck(productName: "Oppo realme 2 Pro 128 GB", priceSAR: "1665 SAR", QTY : "662"),
        procheck(productName: "Oppo realme 2 Pro 128 GB ….", priceSAR: "165 SAR", QTY : "2"),
        procheck(productName: "Oppo realme 2 Pro 128 GB ….", priceSAR: "165 SAR", QTY : "2"),
        procheck(productName: "Oppo realme 2 Pro 128 GB ….", priceSAR: "165 SAR", QTY : "2"),
        procheck(productName: "Oppo realme 2 Pro 128 GB ….", priceSAR: "165 SAR", QTY : "2"),
        procheck(productName: "Oppo realme 2 Pro 128 GB ….", priceSAR: "165 SAR", QTY : "2"),
        procheck(productName: "Oppo realme 2 Pro 128 GB ….", priceSAR: "165 SAR", QTY : "2")
    ]
    
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
        view = OrderDetailsview
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var x = 0
        var y = 0
        OrderDetailsview.actionDelegete = self
        for i in pro {
            let addview : productCheckout = {
                let view = productCheckout()
                view.namelabel.text = i.productName
                view.Qlabel.text  = i.QTY
                view.Pricelabel.text  = i.priceSAR
                return view
            }()
            OrderDetailsview.orderitemsview.addSubview(addview)
            
            addview.anchor(top: OrderDetailsview.orderitemsview.topAnchor, left: OrderDetailsview.orderitemsview.leftAnchor, bottom: nil, right: OrderDetailsview.orderitemsview.rightAnchor, centerX: nil, centerY: nil, paddingTop: CGFloat(72 + x), paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            x += 25
            
        }
       OrderDetailsview.orderitemsview.heightAnchor.constraint(equalToConstant: CGFloat(75 + x)).isActive = true
        
        for i in pro {
            let addview : OrderDetailsView = {
                let view = OrderDetailsView()
                view.namelabel.text = i.productName
                view.Pricelabel.text  = i.priceSAR
                return view
            }()
            OrderDetailsview.detailsorderView.addSubview(addview)
            
            addview.anchor(top: OrderDetailsview.detailsorderView.topAnchor, left: OrderDetailsview.detailsorderView.leftAnchor, bottom: nil, right: OrderDetailsview.detailsorderView.rightAnchor, centerX: nil, centerY: nil, paddingTop: CGFloat(40 + y), paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            y += 25
            
        }
        OrderDetailsview.detailsorderView.heightAnchor.constraint(equalToConstant: CGFloat(76 + y)).isActive = true
        
    }
    
    func saveButtonTapped() {
        
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func getOrderDetail(){
        APIClient.getOrdersDetails(orderSerial: orderSerial ?? "") { (result) in
            switch result{
            case.success(let data):
                print(data)
            case.failure(let error):
                print(error)
            }
        }
    }
}
