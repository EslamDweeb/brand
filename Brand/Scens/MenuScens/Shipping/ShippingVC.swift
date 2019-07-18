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
    var defaultaddress : Address?
    lazy var mainView: ShippingView = {
        let v = ShippingView()
        return v
    }()
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
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }

    func changeBtn() {
        
    }
    func addBtn() {
        let address = AddressInfoViewController()
        self.present(address, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         handelReachability(reachability: reachability)
        addresses.removeAll()
        
        mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        DispatchQueue.main.async {
            APIClient.UserAddress
                { (result) in
                    switch result {
                    case .success(let data) :
                        if data.data.count != 0{
                            self.mainView.viewnoaddress.isHidden = true
                            self.mainView.viewwithAddress.isHidden = false
                            
                            for address in data.data {
                                self.addresses.append(Address(id: address.id, country: address.country, state: address.state, city: address.city, addressName: address.addressName, detailedAddress: address.detailedAddress, personName: address.personName, phone: address.phone, postalCode:  address.postalCode, lat: address.lat, lng: address.lng, main: address.main))
                                if address.main == true {
                                    self.defaultaddress = address
                                    self.mainView.addressName.text = address.addressName
                                    
                                    if address.detailedAddress != nil {
                                        self.mainView.addressDescription.text = "\(address.country.name ?? "hhh")-  \(address.state.name ?? "")-\(address.city)-\(address.detailedAddress!)"
                                    }else{
                                        self.mainView.addressDescription.text = "\(address.country.name ?? "hhhh")- \(address.state.name ?? "")-\(address.city)"
                                        
                                    }
                                }
                            }
                            DispatchQueue.main.async {
                              //  self.mainView.tableView.reloadData()
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
        }
    }
   
}
