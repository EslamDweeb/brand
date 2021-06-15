//
//  FilterViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FilterViewController:UIViewController,ButtonActionDelegate {
    
    var delegate : isAbleToReceiveData?
    var Brands : [Brandfilter]?
    var BrandName = ""
     var MadeIns : [String] = []
     var searchitems: [DetailedConfig] = []
    var name = ""
    var showfilter = ""
    lazy var mainView:SearchFilterView = {
        let v = SearchFilterView(delegate: self)
        return v
    }()
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.delegate = self
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        APIClient.getproductFilters { (result) in
            switch result {
            case .success(let data) :
                
                self.Brands = data.brands!
              
                for i in data.origin ?? []
                {
                    if i.madeIn != nil {
                        self.MadeIns.append(i.madeIn!)
                    }
                   
                }
               
                self.mainView.brands = self.Brands
                self.mainView.madeIn = self.MadeIns
           
            case .failure(let Err):
                
                print(Err)
            }
        }
     
        self.mainView.bradDropDown.dropView.tableView.reloadData()
        self.mainView.madeInDropDown.dropView.tableView.reloadData()
      //  self.mainView.madeInDropDown.height.constant = 50
        
    }
    
    func continuePressed() {
    
        DispatchQueue.main.async {

            if self.mainView.bradDropDown.titleLabel?.text != nil {
                self.BrandName = self.mainView.bradDropDown.dropView.dropDownOptions[(self.mainView.bradDropDown.dropView.indexPath?.row)!]["slug"] as! String
                print (self.BrandName)
            }
            var PriceBetween = ""
            if self.mainView.fromTextFeild.text != "" &&  self.mainView.toTextFeild.text != "" {
             PriceBetween = "\(self.mainView.fromTextFeild.text!),\(self.mainView.toTextFeild.text!)"
            }
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getsearchitems(name: self.name ,brand: self.BrandName , origin: self.mainView.madeInDropDown.titleLabel?.text ?? "" , price: PriceBetween, rate: "\(self.mainView.rateView.rating)", show: self.showfilter, page: 1, tag: nil , complition: { (result) in
                switch result{
                case .success(let data):
                    self.searchitems = data.configs!
                    DispatchQueue.main.async {
                        print(self.searchitems.count)
                        self.delegate?.pass(data: data.configs!, brand: self.BrandName, price: PriceBetween, made: self.mainView.madeInDropDown.titleLabel?.text ?? "", Rate: "\(self.mainView.rateView.rating)")
                        self.mainView.activityStopAnimating()
                    }
                case .failure(let error):
                     print(self.searchitems)
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            })
            
        }
         self.dismiss(animated: true, completion: nil)
    }
    func dissmisController() {
       
        self.dismiss(animated: true, completion: nil)
    }
}
