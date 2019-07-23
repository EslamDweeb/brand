//
//  ShippingVC.swift
//  Brand
//
//  Created by nada dyaa on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
class ShippingVC: UIViewController , ButtonActionDelegate {
     let reachability =  Reachability()
     var addresses = [Address]()
    var activeShippingMethod  =  [Bool]()
    var shippingMethodarr = [ShippingMethod]()
    var enable = [Bool]()
     var mainIndexPah:Int?
    var defaultaddress : Address?
    lazy var mainView: ShippingView = {
        let v = ShippingView()
        return v
    }()
    enum CardState {
        case expanded
        case collapsed
    }
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.actionDelegete = self
        mainView.shippingCollectionview.delegate = self
        mainView.shippingCollectionview.dataSource = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CheckoutController.handleCardTap(recognzier:)))
        mainView.BGView.addGestureRecognizer(tapGestureRecognizer)
    }
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            self.animateTransitionIfNeeded(state: nextState)
        default:
            break
        }
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }

    func changeBtn() {
           animateTransitionIfNeeded(state: nextState)
    }
    func addBtn() {
        let address = AddressInfoViewController()
        self.present(address, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         handelReachability(reachability: reachability)
           addresses.removeAll()
        shippingMethodarr.removeAll()
        mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
            APIClient.UserAddress
                { (result) in
                    switch result {
                    case .success(let data) :
                        if data.data.count != 0{
                            self.mainView.viewnoaddress.isHidden = true
                            self.mainView.viewwithAddress.isHidden = false
                             var mainIndex = 0
                            
                            for address in data.data {
                                self.addresses.append(Address(id: address.id, country: address.country, state: address.state, city: address.city, addressName: address.addressName, detailedAddress: address.detailedAddress, personName: address.personName, phone: address.phone, postalCode:  address.postalCode, lat: address.lat, lng: address.lng, main: address.main))
                                if address.main == true {
                                    self.defaultaddress = address
                                    self.mainView.addressName.text = address.addressName
                                     self.mainIndexPah = mainIndex
                                    if address.detailedAddress != nil {
                                        self.mainView.addressDescription.text = "\(address.country.name ?? "hhh")-  \(address.state.name ?? "")-\(address.city)-\(address.detailedAddress!)"
                                    }else{
                                        self.mainView.addressDescription.text = "\(address.country.name ?? "hhhh")- \(address.state.name ?? "")-\(address.city)"
                                        
                                    }
                                }
                                mainIndex += 1
                            }
                            DispatchQueue.main.async {
                                self.mainView.tableView.reloadData()
                                self.mainView.activityStopAnimating()
                            }

                        }else{
                            self.mainView.viewnoaddress.isHidden = false
                            self.mainView.viewwithAddress.isHidden = true
                            self.mainView.activityStopAnimating()
                        }
                    case .failure(let error) :
                        print(error)
                        self.mainView.activityStopAnimating()
                    }
            }
          
            APIClient.getShippimgMethod(complition: { (result)in
                switch result {
                case .success(let data):
                    for method in data.shippingMethods {
                        self.shippingMethodarr.append(method)
                    }
                    DispatchQueue.main.async {
                        self.activeShippingMethod = self.checkShippingMethod()
                        self.mainView.shippingCollectionview.reloadData()
                        self.mainView.activityStopAnimating()
                    }
                case .failure(let error) :
                    print(error)
                    self.mainView.activityStopAnimating()
                }
            })
                
            
        
    }
    func checkShippingMethod() -> [Bool] {
        var arr = [Bool]()
         var array = [Int]()
        for shippning in shippingMethodarr {
            for item in shippning.country.states! {
                array.append(item.id)
            }
            if defaultaddress != nil {
            if (array.contains(defaultaddress!.state.id)){
                
               arr.append(true)
                
            }else{
                  arr.append(false)
            }
            }
            }
        return arr
        
    }
    func animateTransitionIfNeeded (state:CardState) {
       
        
                switch state {
                case .expanded:
                  
                    mainView.HeightConstrainTableView?.constant = self.view.frame.height / 2
                   
                    UIView.animate(withDuration: 0.9, delay: 0, options: .curveLinear, animations: {
                        self.mainView.layoutIfNeeded()
                         self.mainView.addnewadd.isHidden = false
                       
                    })
                      self.mainView.topConstrainlabel?.constant  = 8
                     self.cardVisible = !self.cardVisible
                    self.mainView.BGView.isHidden = false
                
                case .collapsed:
                    
                    mainView.HeightConstrainTableView?.constant = 0
                   
                    UIView.animate(withDuration: 0.9, delay: 0, options: .curveLinear, animations: {
                        self.mainView.layoutIfNeeded()
                        
                    })
                    self.mainView.topConstrainlabel?.constant  = 0

                    self.mainView.addnewadd.isHidden = true
                     self.mainView.BGView.isHidden = true
                     self.cardVisible = !self.cardVisible
                    
                }
            }
    
   
 
    
}
