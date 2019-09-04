//
//  CarController.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import EasyTipView

class CartController : UIViewController ,ButtonActionDelegate{
    //MARK:- Var&Con
    var shouldShowLoadingCell = false
    var currentPage:Int = 1
    var lastPage:Int?
    var mainView = CartView()
    var cartpro: [CartItem] = []
    let reachability =  Reachability()
    var totalPrice = 0.0
    var preferences = EasyTipView.Preferences()
    var show = true
    var tipView:EasyTipView?
    var isShowTip = false
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    //MARK:- Controller Life cycle
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        preferences.drawing.font = UIFont(name: .fontM, size: 13)!
        preferences.drawing.foregroundColor = UIColor.white
        preferences.drawing.backgroundColor = .gray
        EasyTipView.globalPreferences = preferences
        //preferences.positioning.maxWidth = self.view.frame.size.width - 50
        //  preferences.drawing.arrowPosition = .top
        mainView.actionDelegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.tableView.backgroundColor = .backgroundColl
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        getCartData(true)
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
    //MARK:- Helper Functions
    
    func saveButtonTapped() {
        self.presentViewController(controller: ShippingVC(), transitionModal: nil, presentationStyle: nil)
    }
    func applyBtnTapped() {
          self.presentViewControllerFromStoryBoard(identifier: "mainTabVC")
    }
    func infoTapped(_ sender: UIButton) {
        if isShowTip == false{
            tipView = EasyTipView(text: cartpro[sender.tag].sellerNotes ?? "" , preferences: preferences)
            guard let cell = mainView.tableView.cellForRow(at: [0,sender.tag]) as? CartCell else {return}
            tipView?.show(forView: cell.infoBtn , withinSuperview: self.mainView)
            self.isShowTip = !self.isShowTip
        }else{
            tipView?.dismiss(withCompletion: nil)
            self.isShowTip = !self.isShowTip
        }
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func getCartData(_ refresh:Bool = false){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getCartData(page: self.currentPage) { (result) in
                switch result{
                case.success(let data):
                    if refresh {
                        self.cartpro = data.cartItems ?? []
                    } else {
                        for conf in data.cartItems ?? [] {
                            self.cartpro.append(conf)
                        }
                    }
                    DispatchQueue.main.async {
                        self.mainView.activityStopAnimating()
                        self.shouldShowLoadingCell = ( data.meta?.currentPage ?? 0) < (data.meta?.lastPage ?? 0)
                        self.mainView.tableView.reloadData()
                    }
                    print (data)
                case .failure(let error):
                    print(error)
                    self.mainView.activityStopAnimating()
                }
            }
        }
    }
    func fetchNextPage() {
        currentPage += 1
        getCartData()
    }
    func getTotalCartItemsPrice() -> String {
        totalPrice = 0.0
        for item in cartpro {
            totalPrice += item.config.ReturnTotalPriceAfterSale(price: Double(item.itemOverallPrice), QTY: Double(item.qty))
        }
        
        return "\(totalPrice)"
    }
    
    
    func startShppingEmptyCart(_ sender: UIButton) {
        print("click on start shopping ")
    }
    func loginBtnTapped() {
        self.presentLoginViewController(loginDismiss: true)
    }
}


