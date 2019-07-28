//
//  checkoutVC.swift
//  Brand
//
//  Created by nada dyaa on 7/25/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
class checkoutVC : UIViewController ,ButtonActionDelegate{
   lazy var mainView : CheckoutView = {
        let view = CheckoutView(delegete : self)
       return view
    }()
    let reachability =  Reachability()
    var items: [CartItems] = []
    var x = 0
    var orderdata : orderdataop?
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
    }
    
    func saveButtonTapped() {
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
            APIClient.getCheckoutData(flag : false ,shippingID: self.orderdata!.shippingID!, billingID: self.orderdata!.billingID!, addressID: self.orderdata!.addreddID!, coupon: self.orderdata!.coupon!, complition:  { (result) in
                switch result{
                case.success(let data):
                    print("nada \(data)")
                    DispatchQueue.main.async {
                       self.createAlert(erroMessage: data.message)
                        self.mainView.activityStopAnimating()
                    }
                case.failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            }
            )}
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func getOrderDetail(){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
            APIClient.getCheckoutData(flag : true ,shippingID: self.orderdata!.shippingID!, billingID: self.orderdata!.billingID!, addressID: self.orderdata!.addreddID!, coupon: self.orderdata!.coupon!, complition:  { (result) in
                switch result{
                case.success(let data):
                    print("nada \(data)")
                    DispatchQueue.main.async {
                        self.mainView.order = data.orderSummary
                        self.items = data.orderSummary?.cartItems ?? []
                        self.createItemDetailView()
                         self.CreateOrderDetailView()
                        self.mainView.activityStopAnimating()
                    }
                case.failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            }
            )}
    }
    private func createItemDetailView(){
        if self.items.count == 0 {
            self.mainView.orderitemsview.isHidden = true
        }else{
            self.mainView.orderitemsview.isHidden = false
            
            for i in self.items {
                let addview : productCheckout = {
                    let view = productCheckout()
                    view.namelabel.text = i.name
                    view.Qlabel.text  = "\(i.qty!)"
                    view.Pricelabel.text  = "\(i.totalQtyPrice!)"
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
    }
    private func CreateOrderDetailView(){
        self.mainView.detailsorderView.heightAnchor.constraint(equalToConstant: CGFloat(170)).isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
    }
    

}
