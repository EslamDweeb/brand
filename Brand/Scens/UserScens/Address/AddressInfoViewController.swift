//
//  AddressInfoViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/30/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import GooglePlaces
import GooglePlacePicker

class AddressInfoViewController: UIViewController, ButtonActionDelegate , DisplayViewControllerDelegate,vcProtocol{
    
    var x = 0
    var cc = 0
    var ss = 0
    var addressedit : Address? {
        didSet{
            guard let address = addressedit else{return}
            self.addressView.PersonName.text = address.personName
            self.addressView.phone.text = address.phone
            self.addressView.city.text = address.city
            self.addressView.detailAddress.text = address.detailedAddress
            self.ss = address.state.id
            self.cc = address.country.id
            print(cc)
            self.x = self.cc - 1
            if address.lat == nil {
                self.addressView.lat.text = ""
            }else{
                self.addressView.lat.text = "\(address.lat ?? 0)"
            }
            if address.lng == nil {
                self.addressView.lang.text = ""
            }else{
                self.addressView.lang.text = "\(address.lng ?? 0)"
            }
            if "\(address.postalCode ?? nil  ?? "0")" == "nil" {
                self.addressView.postalcode.text = ""
            }else {
                self.addressView.postalcode.text =  "\(address.postalCode ?? "0")"
            }
        }
    }
    var countries :[Country]?
    let reachability =  Reachability()
    
    lazy var addressView: AddressInfoView = {
        let view = AddressInfoView(delegate: self)
        return view
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = addressView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        addressView.country.dropView.vcDelegate = self
        addressView.state.dropView.vcDelegate = self
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        addressView.View.addGestureRecognizer(tap)
    }
    
    @objc  func dismissKeyboard() {
        addressView.endEditing(true)
        addressView.state.dissmisDropDown()
        addressView.country.dissmisDropDown()
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    func pickButtonTapped() {
        
        self.presentViewController(controller: PickMapVC(delegate: self), transitionModal: .coverVertical, presentationStyle: .custom)
        
    }
    func applyBtnTapped() {
        
        if (addressView.PersonName.text != "") || (addressView.addressName.text != "") || (addressView.city.text != "") || (addressView.phone.text != "") || (addressView.postalcode.text != "") {
            let response = Validation.shared.validate(values: (ValidationType.PersonName ,addressView.PersonName.text!),(ValidationType.Addressname ,addressView.addressName.text!),(ValidationType.city ,addressView.city.text!),(ValidationType.phone ,addressView.phone.text!),(ValidationType.postal_code ,addressView.postalcode.text!),(ValidationType.lat ,addressView.lat.text!) ,(ValidationType.Lng ,addressView.lang.text!))
            switch response {
            case .success:
                if addressedit?.id != nil{
                    self.addressView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
                    APIClient.editaddress(Id:String(addressedit!.id), countryID:  cc , stateID:ss , city: addressView.city.text ?? "", addressName: addressView.addressName.text ?? "", detailedAddress: addressView.detailAddress.text ?? "", personName: addressView.PersonName.text ?? "", postalCode: addressView.postalcode.text ?? "", phone: addressView.phone.text ?? "", lat: addressView.lat.text ?? "", lng: addressView.lang.text ?? ""){ (result) in
                        switch result {
                        case .success(let data) :
                            self.addressView.activityStopAnimating()
                            self.createAlert(title: NSLocalizedString( "Success", comment: ""), erroMessage: data.message ?? "")
                            print(data.errors ?? [])
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)){
                                self.dismissPressentededControllers()
                                self.dismiss(animated: true, completion: nil)
                            }
                        case .failure(let error) :
                            self.addressView.activityStopAnimating()
                            print(error)
                        }
                    }
                    
                }else{
                    var cc = 0
                    var ss = 0
                    if addressView.country.dropView.indexPath?.row != nil {
                        cc = addressView.country.dropView.dropDownOptions[(addressView.country.dropView.indexPath?.row)!]["id"] as! Int
                    }
                    if addressView.state.dropView.indexPath?.row != nil {
                        ss = addressView.state.dropView.dropDownOptions[(addressView.state.dropView.indexPath?.row)!]["id"] as! Int
                    }
                    self.addressView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
                    APIClient.addAddress(countryID: cc , stateID:ss, city: addressView.city.text ?? "", addressName: addressView.addressName.text ?? "", detailedAddress: addressView.detailAddress.text ?? "", personName: addressView.PersonName.text ?? "", postalCode: addressView.postalcode.text ?? "0", phone: addressView.phone.text ?? "", lat: Double(addressView.lat.text ?? "0"), lng: Double (addressView.lang.text ?? "0"))
                    { (result) in
                        switch result {
                        case .success(let data) :
                            self.addressView.activityStopAnimating()
                            self.createAlert(title: nil, erroMessage: data.message ?? "")
                            DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)){
                                self.dismissPressentededControllers()
                                self.dismiss(animated: true, completion: nil)
                            }
                        case .failure(let error) :
                            self.addressView.activityStopAnimating()
                            print(error)
                        }
                    }
                }
            case .failure(_, let message):
                self.createAlert(title: nil, erroMessage: message.localized())
            }
        }else{
            self.createAlert(title: nil, erroMessage: NSLocalizedString( "allFieldsreq", comment: ""))
        }
    }
    func getIndexPath(indexPath: IndexPath, _ sender: DropDownView) {
        if sender == addressView.country.dropView {
            x = indexPath.row
            self.addressView.stateList = self.countries![x].states
            print(x)
            self.addressView.state.setTitle( self.countries![x].states![0].name, for: .normal)
            self.addressView.state.dropView.tableView.reloadData()
            cc = addressView.country.dropView.dropDownOptions[indexPath.row]["id"] as! Int
            print(cc)
        }else{
            ss = addressView.state.dropView.dropDownOptions[indexPath.row]["id"] as! Int
            print(ss)
        }
    }
    
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        DispatchQueue.main.async {
            guard let data = UserDefaults.standard.data(forKey: Constants.Defaults.countries) else {
                return
            }
            do {
                self.countries = try JSONDecoder().decode([Country].self, from: data)
            } catch {
                print(error)
            }
            //print(self.countries)
            DispatchQueue.main.async {
                self.addressView.addressName.text = self.addressedit?.addressName
                self.addressView.cant = self.countries
                if self.addressedit != nil {
                    self.addressView.country.setTitle(self.addressedit?.country.name, for: .normal)
                    self.addressView.state.setTitle(self.addressedit?.state.name, for: .normal)
                    self.addressView.stateList = self.countries?[self.x].states
                    self.addressView.state.dropView.tableView.reloadData()
                   // print(self.addressView.stateList)
                    //self.addressView.stateList = self.addressedit?.country.states
                    self.addressView.country.setTitleColor(.black, for: .normal)
                    self.addressView.state.setTitleColor(.black, for: .normal)
                    self.addressView.detailAddress.textColor = .black
                }else {
                    
                    self.addressView.country.setTitle(self.countries![0].name, for: .normal)
                    self.addressView.state.setTitle( self.countries![0].states![0].name, for: .normal)
                    self.addressView.stateList = self.countries![0].states
                }  
            }
        }
    }
    func doSomethingWith(lat : Double , len : Double) {
        addressView.lat.text = String(lat)
        addressView.lang.text = String(len)
    }
}
