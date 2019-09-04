//
//  billngVC.swift
//  Brand
//
//  Created by nada dyaa on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
class BillingVC: UIViewController , ButtonActionDelegate {
    var addressID : Int?
    var shippingId : Int?
    var billingMethodarr = [BillingMethod]()
      var MianbillingID : Int?
    let reachability =  Reachability()
    lazy var mainView: BillingView = {
        let v = BillingView(delegete: self, collectiondelegete: self, collectionDatasource: self)
        return v
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
      
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        billingMethodarr.removeAll()
        APIClient.getBillingMethod(complition: { (result)in
            switch result {
            case .success(let data):
                for method in data.billingMethods {
                    self.billingMethodarr.append(method)
                }
                self.mainView.BillingCollectionview.reloadData()
                self.mainView.activityStopAnimating()
                
            case .failure(let error) :
                print(error)
                self.mainView.activityStopAnimating()
            }
        })
        
        
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    func saveButtonTapped() {
        let  VC = checkoutVC()
        if MianbillingID != nil {
            if mainView.copoundiscount.isHidden == true {
                 VC.orderdata = orderdataop(shippingID: shippingId, billingID: MianbillingID, addreddID: addressID, coupon: "")
            }else {
                VC.orderdata = orderdataop(shippingID: shippingId, billingID: MianbillingID, addreddID: addressID, coupon: self.mainView.copounTextFeild.text)
            }
           
            self.present(VC, animated: true, completion: nil)
        }else {
            self.createAlert(erroMessage: "You Must select Your Billing Methoud")
        }
    }
    func changeBtn() {
        if mainView.copounTextFeild.text!.count > 6 {
            DispatchQueue.main.async {
               // self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
                APIClient.getCheckoutData(flag : true ,shippingID: self.shippingId!, billingID: 1, addressID: self.addressID!, coupon: self.mainView.copounTextFeild.text!, complition:  { (result) in
                    switch result{
                    case.success(let data):
                        print("nada \(data)")
                        DispatchQueue.main.async {
                            if (data.errors?.coupon_serial == nil) {
                               
                                self.mainView.CopounSArlbl.text = "\(data.orderSummary!.coupon!.amount) \("sar".localized)"
                                self.mainView.AmountSArlbl.text = "\(data.orderSummary!.totalCartItemsPrice) \("sar".localized)"
                                self.mainView.Sarlbl.text = "\( data.orderSummary!.totalCartItemsPrice - Double( data.orderSummary!.coupon!.amount)) \("sar".localized)"
                                self.mainView.hieghtConstrainViewcopoun?.constant = 250
                                self.mainView.rightBtn.isHidden = false
                                self.mainView.AmountSArlbl.isHidden = false
                                self.mainView.CopounSArlbl.isHidden = false
                                self.mainView.Sarlbl.isHidden = false
                                self.mainView.Amountlbl.isHidden = false
                                self.mainView.Copounlbltext.isHidden = false
                                self.mainView.Totallbl.isHidden = false
                                self.mainView.copoundiscount.isHidden = false
                            }else{
                                
                                self.mainView.hieghtConstrainViewcopoun?.constant = 120
                                self.mainView.rightBtn.isHidden = true
                                self.mainView.AmountSArlbl.isHidden = true
                                self.mainView.CopounSArlbl.isHidden = true
                                self.mainView.Sarlbl.isHidden = true
                                self.mainView.Amountlbl.isHidden = true
                                self.mainView.Copounlbltext.isHidden = true
                                self.mainView.Totallbl.isHidden = true
                                self.mainView.copoundiscount.isHidden = true
                            }
                           // self.mainView.activityStopAnimating()
                        }
                    case.failure(let error):
                       // self.mainView.activityStopAnimating()
                        print(error)
                    }
                }
                )}

        }

        UIView.animate(withDuration: 0.4, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
    }
}
