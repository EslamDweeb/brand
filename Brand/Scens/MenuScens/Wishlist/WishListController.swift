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
    case seeAll
}
class WishListController: UIViewController,ButtonActionDelegate {
    lazy var mainView: WishListView = {
        let v = WishListView(delegate: self, dataSource: self,actionDelegate:self)
        v.backgroundColor = .white
        return v
    }()
    var shouldShowLoadingCell = false
    var currentPage:Int = 1
    var lastPage:Int?
    var slug:String?
    var key:String?
    var vcType:VCType = .wishList
    let reachability =  Reachability()
    let cellID = "cellID"
    var wishes: [Config] = []
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    init(_ navTitle:String? = nil,_ key:String? = nil,_ vcType: VCType? = .wishList){
        super.init(nibName: nil, bundle: nil)
        self.key = key
        self.mainView.navView.titlelabel.text = navTitle
        self.vcType = vcType!
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
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
        switchBetweenServices(vcType: self.vcType,refresh: true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
    private func switchBetweenServices(vcType:VCType,refresh:Bool = false){
        switch vcType {
        case .wishList:
            getWishlist(currentPage,refresh)
        case .allProduct:
            getAllProducts()
        case .seeAll:
            getSeeAllProducts(self.key,refresh)
        }
    }
    
    func applyBtnTapped() {
        self.present(searchVC(), animated: true, completion: nil)
    }
    //MARK:- Paging Functions
    func fetchNextPage() {
        currentPage += 1
        switchBetweenServices(vcType: self.vcType)
    }
   
    //MARK:- API-Service Functions
    
    private func getWishlist(_ pageNumber:Int,_ refresh:Bool = false){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getWishList(pageNumber:pageNumber ,complition: { (result) in
                switch result{
                case .success(let data):
                    if refresh {
                        self.wishes = data.favorites
                    } else {
                        for conf in data.favorites {
                            self.wishes.append(conf)
                        }
                    }
                    DispatchQueue.main.async {
                        self.mainView.activityStopAnimating()
                        self.shouldShowLoadingCell = ( data.meta.currentPage ?? 0) < (data.meta.lastPage ?? 0)
                        self.mainView.wishCollection.reloadData()
                    }
                case .failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            })
        }
    }
    private func getAllProducts(_ refresh:Bool = false) {
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getAllProductConfigs(slug: self.slug ?? "", pageNumber: self.currentPage, complition: { (result) in
                switch result{
                case .success(let data):
                    if refresh {
                        self.wishes = data.configs
                    } else {
                        for conf in data.configs {
                            self.wishes.append(conf)
                        }
                    }
                    DispatchQueue.main.async {
                        self.mainView.activityStopAnimating()
                        self.shouldShowLoadingCell = ( data.meta.currentPage ?? 0) < (data.meta.lastPage ?? 0)
                        self.mainView.wishCollection.reloadData()
                    }
                case .failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            })
        }
    }
    private func getSeeAllProducts(_ key:String? = "",_ refresh:Bool = false){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getSeeAllProduct(key: key!,pageNumber: self.currentPage, complition: { (result) in
                switch result{
                case.success(let data):
                    if refresh {
                        self.wishes = data.configs
                    } else {
                        for conf in data.configs {
                            self.wishes.append(conf)
                        }
                    }
                    DispatchQueue.main.async {
                        self.mainView.activityStopAnimating()
                        self.shouldShowLoadingCell = ( data.meta.currentPage ?? 0) < (data.meta.lastPage ?? 0)
                        self.mainView.wishCollection.reloadData()
                    }
                case.failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            })
        }
    }
}
