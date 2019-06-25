//
//  MenuViewController.swift
//  Brands
//
//  Created by IOS on 3/14/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController,ButtonActionDelegate {

    let cellid = "cellid"
    let fbURLID = URL(string: "https://www.facebook.com")
    let twURLID = URL(string: "https://www.twitter.com")
    let LoggedArray = [
                       NSLocalizedString("personal_information", comment: ""),
                       NSLocalizedString("myAddresses", comment: ""),
                       NSLocalizedString("cart", comment: ""),
                       NSLocalizedString("wishlist", comment: ""),
                       NSLocalizedString("myOrders", comment: ""),
                       NSLocalizedString("myReview", comment: ""),
                       NSLocalizedString("language", comment: ""),
                       NSLocalizedString("about", comment: ""),
                       NSLocalizedString("terms&privacy", comment: ""),
                       NSLocalizedString("customerService", comment: ""),
                       NSLocalizedString("returnPolicy", comment: "") ,
                       NSLocalizedString("saleInBrand", comment: ""),
                       NSLocalizedString("buyFromBrand", comment: ""),
                       NSLocalizedString("logout", comment: "")
    ]
    
    let NotLoggedArray = [
                          NSLocalizedString("login", comment: ""),
                          NSLocalizedString("language", comment: ""),
                          NSLocalizedString("about", comment: ""),
                          NSLocalizedString("terms&privacy", comment: ""),
                          NSLocalizedString("customerService", comment: ""),
                          NSLocalizedString("returnPolicy", comment: "") ,
                          NSLocalizedString("saleInBrand", comment: ""),
                          NSLocalizedString("buyFromBrand", comment: "")
    ]
    
    let loggedimagesnames = ["personal info","address","cart-4","wishlist","my orders","reviews","language","about","terms and policy","customer service","return policy","sell","buy","logout"]
    let notloggedimagesnames = ["login","language","about","terms and policy","customer service","return policy","sell","buy"]
    let w_loggedimagesnames = ["personal info_w","address_w","cart_w","my orders_w","wishlist_w","reviews_w","language_w","about_w","terms and policy_w","customer service_w","return policy_w","info_w","go_back","log out_w"]
    let w_notloggedimagesnames = ["log in_w","sign up_w","language_w","about_w","terms and policy_w","customer service_w","return policy_w","info","go_back"]
    
    lazy var mainView:MenuView = {
        let v = MenuView(delegate: self, dataSource: self,actionDelegate:self)
        return v
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let indexPath = mainView.newTable.indexPathForSelectedRow {
            //mainView.newTable.cellForRow(at: indexPath)?.backgroundColor = .white
            mainView.newTable.deselectRow(at: indexPath, animated: false)
            mainView.newTable.cellForRow(at: indexPath)?.backgroundColor = .white
            mainView.newTable.reloadData()
        }
    }
    func faceBookLogin() {
        if(UIApplication.shared.canOpenURL(fbURLID!)){
            // FB installed
            UIApplication.shared.open(fbURLID!, options:[:], completionHandler: nil)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(fbURLID!, options:[:], completionHandler: nil)
        }
    }
    func twitterLogin() {
        if(UIApplication.shared.canOpenURL(twURLID!)){
            // FB installed
            UIApplication.shared.open(twURLID!, options:[:], completionHandler: nil)
        } else {
            // FB is not installed, open in safari
            UIApplication.shared.open(twURLID!, options:[:], completionHandler: nil)
        }
    }
}

