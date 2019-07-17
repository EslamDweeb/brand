//
//  SubCategoryVC.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/7/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit


class SubCategoryVC:UIViewController,ButtonActionDelegate{
    //MARK:- Define Variables and Constants
    lazy var mainView:SubCtegoryView = {
        let v = SubCtegoryView(delegate: self,dataSource: self,actionDelegate: self)
        v.backgroundColor = .white
        return v
    }()
    var slug:String?
    var subCategories = [Category]()
    var configs = [Config]()
    let cellID = "cellID"
    let cellID2 = "cellID2"
    let dispatchGroup = DispatchGroup()
    let reachability =  Reachability()

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK:- Controller View life cycle
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.configCollection.delegate = self
        mainView.configCollection.dataSource = self
//        getVCData(slug: self.slug ?? "")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        getVCData(slug: self.slug ?? "")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
    //MARK:-ActionDelegate
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    func selectSubCategory(slug:String){
        subCategories.removeAll()
        configs.removeAll()
        getVCData(slug: slug)
    }
    func getVCData(slug:String){
        dispatchGroup.enter()
        getCategoryProducts()
        dispatchGroup.enter()
         getSubCategory(slug: slug)
        dispatchGroup.notify(queue: .main){
            self.mainView.categoriesCollection.reloadData()
            self.mainView.configCollection.reloadData()
            print("Tasks is finished !!!!!!!!!!!!!!!!!!!!!")
        }
    }
    private func getSubCategory(slug:String){
        APIClient.getCategoryInfo(slug: slug ) { (result) in
            switch result{
            case .success(let data):
                DispatchQueue.main.async {
                self.subCategories = data.category?.childs ?? []
                   self.mainView.categoriesCollection.reloadData()
                }
                self.dispatchGroup.leave()
            case .failure(let error):
                print(error)
                self.dispatchGroup.leave()
            }
        }
    }
    private func getCategoryProducts(){
        APIClient.getCategoryProducts(slug: slug ?? "") { (result) in
            var configss = [Config]()
            switch result{
            case .success(let data):
                 DispatchQueue.main.async {
                for product in data.products{
                    for config in product.configs ?? [] {
                          configss.append(config)
                         }
                    
                    }
                     self.configs = configss
                     self.mainView.configCollection.reloadData()
                    print("dtatadtdattdat!@#$#@!@#$#@!@#$#@!",self.configs)
                 }
                
                  self.dispatchGroup.leave()
            case .failure(let error):
                print(error)
                self.dispatchGroup.leave()
            }
        }
    }
}