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
        
    }
    func changeBtn() {
        if mainView.copounTextFeild.text!.count > 3 {
           mainView.hieghtConstrainViewcopoun?.constant = 250
            mainView.rightBtn.isHidden = false
            mainView.AmountSArlbl.isHidden = false
            mainView.CopounSArlbl.isHidden = false
            mainView.Sarlbl.isHidden = false
            mainView.Amountlbl.isHidden = false
            mainView.Copounlbltext.isHidden = false
            mainView.Totallbl.isHidden = false
            mainView.copoundiscount.isHidden = false
        }else{
            
            mainView.hieghtConstrainViewcopoun?.constant = 120
            mainView.rightBtn.isHidden = true
            mainView.AmountSArlbl.isHidden = true
            mainView.CopounSArlbl.isHidden = true
            mainView.Sarlbl.isHidden = true
            mainView.Amountlbl.isHidden = true
            mainView.Copounlbltext.isHidden = true
            mainView.Totallbl.isHidden = true
            mainView.copoundiscount.isHidden = true
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
    }
}
