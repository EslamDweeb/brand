//
//  searchVC.swift
//  Brand
//
//  Created by nada dyaa on 8/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit


class searchVC: UIViewController,ButtonActionDelegate {
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
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
                  getItems()
        }
    func getItems()  {
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getsearchitems(name: "bl", complition: { (result) in
                switch result{
                case .success(let data):
                    self.searchitems = data.configs!
                    DispatchQueue.main.async {
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

