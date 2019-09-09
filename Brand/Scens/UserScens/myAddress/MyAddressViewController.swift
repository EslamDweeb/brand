//
//  MyAddressViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
//protocol addressDelegate {
//    func ReceveAdd(Id : Address)
//}
class MyAddressViewController: UIViewController ,ButtonActionDelegate{
    // var delegetadd : addressDelegate?
    var mainIndexPah:Int?
    var myAddressView = MyAddressView()
    var rrr = MyAddressTableBG()
    var defaultAddress = [IndexPath]()
    var addresses = [Address]()
    let reachability =  Reachability()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    var cant = [String]()
    override func loadView() {
        super.loadView()
        view = myAddressView
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        handelReachability(reachability: reachability)
        
        rrr.actionDelegate = self
        myAddressView.actionDelegate = self
        myAddressView.tableView.delegate = self
        myAddressView.tableView.dataSource = self
        
    }
    func saveButtonTapped() {
        let dest = AddressInfoViewController()
        self.present(dest, animated: true) {
        }
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        addresses.removeAll()
        if  UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != ""{
            getUsreAdresses()
        }else{
            self.present(LoginViewController(), animated: true, completion: nil)
        }
    }
    private func getUsreAdresses(){
        DispatchQueue.main.async {
            self.myAddressView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
            APIClient.UserAddress
                { (result) in
                    switch result {
                    case .success(let data) :
                        print(data)
                        var mainIndex = 0
                        if data.data.count != 0{
                            for address in data.data {
                                self.addresses.append(Address(id: address.id, country: address.country, state: address.state, city: address.city, addressName: address.addressName, detailedAddress: address.detailedAddress, personName: address.personName, phone: address.phone, postalCode:  address.postalCode, lat: address.lat, lng: address.lng, main: address.main))
                                if address.main {
                                    self.mainIndexPah = mainIndex
                                }
                                mainIndex += 1
                                
                            }
                            
                            DispatchQueue.main.async {
                                self.myAddressView.tableView.reloadData()
                                self.myAddressView.activityStopAnimating()
                                
                            }
                        }else{
                            self.myAddressView.activityStopAnimating()
                            self.myAddressView.tableView.backgroundView =  MyAddressTableBG()
                        }
                    case .failure(let error) :
                        print(error)
                        self.myAddressView.activityStopAnimating()
                    }
            }
        }
    }
}
