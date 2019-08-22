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
class WishListController: UIViewController,ButtonActionDelegate , isAbleToReceiveData{
    func pass(data: [Config],brand : String ,price : String ,made : String ,Rate : String) {
        print(data)
        currentPage = 1
        self.brand = brand
        self.price = price
        self.rate = Rate
        self.made = made
        Beforefilter = false
        // wishes.removeAll()
      //  switchBetweenServices(vcType: self.vcType,refresh: true)
       wishes = data
        self.mainView.wishCollection.reloadData()
    }
    
    lazy var mainView: WishListView = {
        let v = WishListView(delegate: self, dataSource: self,actionDelegate:self)
        v.backgroundColor = .white
        return v
    }()
    var Beforefilter = true
    var shouldShowLoadingCell = false
    var currentPage:Int = 1
    var lastPage:Int?
    var slug:String?
    var key:String?
    var vcType:VCType = .wishList
    let reachability =  Reachability()
    let cellID = "cellID"
    var wishes: [Config] = []
    var brand  = ""
    var made = ""
    var price  = ""
    var rate = ""
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
        if Beforefilter {
             switchBetweenServices(vcType: self.vcType,refresh: true)
        }
       
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
    func filterBtnTapped() {
        let CV = FilterViewController()
        CV.delegate = self
        CV.showfilter = self.key!
         self.presentViewController(controller: CV, transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)
    }
    func applyBtnTapped() {
        self.present(searchVC(), animated: true, completion: nil)
    }
    //MARK:- Paging Functions
    func fetchNextPage() {
        currentPage += 1
      //  if Beforefilter {
              switchBetweenServices(vcType: self.vcType)
      //  }
      
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
        if Beforefilter {
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
        }else {
            DispatchQueue.main.async {
                self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
                
                APIClient.getsearchitems(name:"" , brand: self.brand, origin: self.made, price: self.price, rate: self.rate, show: self.key!, page: self.currentPage, complition: { (result) in
                switch result{
                case .success(let data):
                    if data.configs?.count != 0 {
                    if refresh {
                        self.wishes = data.configs!
                    } else {
                    
                        for conf in data.configs! {
                            self.wishes.append(conf)
                        }
                    }
                    
                    }
                     self.shouldShowLoadingCell = ( data.meta?.currentPage ?? 0) < (data.meta?.lastPage ?? 0)
                    DispatchQueue.main.async {
                        self.mainView.activityStopAnimating()
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
}
