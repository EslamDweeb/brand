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
    var mainView = CartView()
    var cartpro: [CartItem] = []
    let reachability =  Reachability()
    var totalPrice = 0.0
    var preferences = EasyTipView.Preferences()
    var show = true
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
            //preferences.positioning.maxWidth = self.view.frame.size.width - 50
      //  preferences.drawing.arrowPosition = .top
            EasyTipView.globalPreferences = preferences
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
         getCartData()
        stopNotifier(reachability: reachability)
    }
    //MARK:- Helper Functions

    func saveButtonTapped() {
        self.presentViewController(controller: ShippingVC(), transitionModal: nil, presentationStyle: nil)
    }
    func infoTapped(_ sender: UIButton) {
       
        let tipView = EasyTipView(text: cartpro[sender.tag].sellerNotes ?? "" , preferences: preferences)
        guard let  cell = mainView.tableView.cellForRow(at: [0,sender.tag]) as? CartCell else {
            return
        }
      
            tipView.show(forView: cell.infoBtn , withinSuperview: self.mainView)
        
//        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(2)) {
// tipView.dismiss()
//        }
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
        totalPrice = 0.0
        for item in cartpro {
            totalPrice += item.config.ReturnTotalPriceAfterSale(price: Double(item.itemOverallPrice), QTY: Double(item.qty))
        }
     
        return "\(totalPrice)"
    }
  
    
    }


