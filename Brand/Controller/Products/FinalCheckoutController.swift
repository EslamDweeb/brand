//
//  CheckoutContoller.swift
//  Brands
//
//  Created by Nada Dyaa on 3/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//
import UIKit
class FinalCheckoutController : UIViewController ,ButtonActionDelegate{
    var FCheckoutview = FinalCheckOutView()
     let reachability =  Reachability()
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
        handelReachability(reachability: reachability)
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
        
        
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = FCheckoutview
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        var x = 0
        var y = 0
        FCheckoutview.actionDelegete = self
        for i in pro {
            let addview : productCheckout = {
               let view = productCheckout()
                view.namelabel.text = i.productName
                view.Qlabel.text  = i.QTY
                view.Pricelabel.text  = i.priceSAR
                return view
            }()
              FCheckoutview.productsView.addSubview(addview)
        
            addview.anchor(top: FCheckoutview.productsView.topAnchor, left: FCheckoutview.productsView.leftAnchor, bottom: nil, right: FCheckoutview.productsView.rightAnchor, centerX: nil, centerY: nil, paddingTop: CGFloat(50 + x), paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        x += 25
        
          }
        FCheckoutview.productsView.heightAnchor.constraint(equalToConstant: CGFloat(58 + x)).isActive = true
        
        for i in pro {
            let addview : OrderDetailsView = {
                let view = OrderDetailsView()
                view.namelabel.text = i.productName
                view.Pricelabel.text  = i.priceSAR
                return view
            }()
            FCheckoutview.OrderView.addSubview(addview)
            
            addview.anchor(top: FCheckoutview.OrderView.topAnchor, left: FCheckoutview.productsView.leftAnchor, bottom: nil, right: FCheckoutview.productsView.rightAnchor, centerX: nil, centerY: nil, paddingTop: CGFloat(40 + y), paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            y += 25
            
        }
        FCheckoutview.OrderView.heightAnchor.constraint(equalToConstant: CGFloat(76 + y)).isActive = true
        
    }
    func saveButtonTapped() {
        
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    
}
