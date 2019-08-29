//
//  searchVC.swift
//  Brand
//
//  Created by nada dyaa on 8/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit
protocol isAbleToReceiveData {
    func pass(data: [Config],brand : String ,price : String ,made : String ,Rate : String)  //data: string is an example parameter
}

class searchVC: UIViewController,ButtonActionDelegate , isAbleToReceiveData{
    func pass(data: [Config],brand : String ,price : String ,made : String ,Rate : String) {
        print(data)
        searchitems = data
         self.mainView.searchCollection.reloadData()
    }
    lazy var mainView: searchView = {
        let v = searchView(delegate: self , dataSource: self, actionDelegate: self)
        v.backgroundColor = .white
        return v
    }()
   let reachability =  Reachability()
    var searchitems: [Config] = []
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    func changeBtn() {
        if mainView.searchtextFeild.text!.count >= 1 {
            getItems( text: mainView.searchtextFeild.text!)
        }else{
            searchitems = []
            self.mainView.FilterBtn.isHidden = true
            self.mainView.searchCollection.reloadData()
        }
    }
    func applyBtnTapped() {
         let CV = FilterViewController()
        CV.name = mainView.searchtextFeild.text!
        CV.delegate = self
        self.presentViewController(controller: CV, transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
       
        handelReachability(reachability: reachability)
        }
    func getItems(text : String )  {
        searchitems.removeAll()
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getsearchitems(name: text, brand: "", origin: "", price: "", rate: "", show: "", page: 1, complition: { (result) in
                switch result{
                case .success(let data):
                    self.searchitems = data.configs!
                    DispatchQueue.main.async {
                        if self.searchitems.count != 0 {
                             self.mainView.FilterBtn.isHidden = false
                        }else{
                             self.mainView.FilterBtn.isHidden = true
                        }
                        self.mainView.searchCollection.reloadData()
                        self.mainView.activityStopAnimating()
                    }
                case .failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            })
           
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
}

