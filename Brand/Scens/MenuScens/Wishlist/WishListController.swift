//
//  WishListController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

enum VCType{
    case wishList
    case allProduct
}
class WishListController: UIViewController,ButtonActionDelegate {
    lazy var mainView: WishListView = {
        let v = WishListView(delegate: self, dataSource: self,actionDelegate:self)
        v.backgroundColor = .white
        return v
    }()
    var currentPage:Int = 1
    var lastPage:Int?
    var slug:String?
    var vcType:VCType = .wishList
    let reachability =  Reachability()
    let cellID = "cellID"
    var wishes: [Config] = []
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
//        switch vcType {
//        case .wishList:
//            getWishlist(pageNumber: currentPage)
//        case .allProduct:
//            getAllProducts()
//        }
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        switchBetweenServices(vcType: self.vcType)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
    private func switchBetweenServices(vcType:VCType){
        switch vcType {
        case .wishList:
            getWishlist(pageNumber: currentPage)
        case .allProduct:
            getAllProducts()
        }
    }
    private func getWishlist(pageNumber:Int){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getWishList(pageNumber:pageNumber ,complition: { (result) in
                switch result{
                case .success(let data):
                    self.wishes = data.favorites
                    self.lastPage = data.meta.lastPage
                    DispatchQueue.main.async {
                        self.mainView.wishCollection.reloadData()
                    }
                    self.mainView.activityStopAnimating()
                case .failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            })
        }
    }
    private func getAllProducts() {
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getAllProductConfigs(slug: self.slug ?? "", complition: { (result) in
                switch result{
                case .success(let data):
                    self.wishes = data.configs
                    DispatchQueue.main.async {
                        self.mainView.wishCollection.reloadData()
                        self.mainView.activityStopAnimating()
                    }
                case .failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            })
            print("hiiiiiiiiiiiiiiii**&&(*&(&*(")
        }
    }
    func infinitePaging(){
        if currentPage <= lastPage ?? 0 {
            currentPage += 1
            APIClient.getWishList(pageNumber:currentPage ,complition: { (result) in
                switch result{
                case .success(let data):
                    for fave in data.favorites{
                         self.wishes.append(fave)
                    }
                    self.lastPage = data.meta.lastPage
                    DispatchQueue.main.async {
                        self.mainView.wishCollection.reloadData()
                    }
                case .failure(let error):
                    print(error)
                }
            })
        }else{return}
    }
}
