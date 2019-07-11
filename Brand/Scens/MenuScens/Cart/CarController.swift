//
//  CarController.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class CartController : UIViewController ,ButtonActionDelegate{
    //MARK:- Var&Con
    var mainView = CartView()
    var cartpro: [CartItem] = []
    let reachability =  Reachability()
    var totalPrice = 0.0
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
        mainView.actionDelegate = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        getCartData()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
    //MARK:- Helper Functions

    func saveButtonTapped() {
        
    }
    
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func getCartData(){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getCartData { (result) in
                switch result{
                case.success(let data):
                    DispatchQueue.main.async {
                        self.cartpro = data.cartItems
                        self.mainView.tableView.reloadData()
                        self.mainView.activityStopAnimating()
                    }
                    print (data)
                case .failure(let error):
                    print(error)
                    self.mainView.activityStopAnimating()
                }
            }
        }
    }
    func getTotalCartItemsPrice() -> String {
        for item in cartpro {
            totalPrice += item.config.ReturnPriceAfterSale(price: Double(item.config.price), sale: Double(item.config.sale))
        }
        return "\(totalPrice.roundToDecimal(3))"
    }
}

