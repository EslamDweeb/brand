//
//  MenuVC_V2.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class MenuVC_V2 : UIViewController {
    
    lazy var mainView : MenuView_V2 = {
       let v = MenuView_V2(delegate: self , dataSource: self , actionDelegate: self )
        return v
    }()
    
    private let isLogin = UserDefaults.standard.bool(forKey: Constants.Defaults.isLogin)
    
    private let TAG_PERSONAL_INFO = 1 , TAG_MYADDRESSES = 2 , TAG_CART = 3 , TAG_SAVED_ITEMS = 4 ,
            TAG_MY_ORDERS = 5 , TAG_MY_REVIEWS = 6 , TAG_LANGUAGE = 7 , TAG_ABOUT = 8 ,
            TAG_TERMS = 9 , TAG_CUSTOMER_SERVICE = 10 , TAG_POLICY = 11 , TAG_SALE_IN_BRAND = 12 ,
            TAG_BUY_FROM_BRAND = 13 , TAG_LOGOUT = 14 , TAG_LOGIN = 15
//    let s = #imageLiteral(resourceName: "login")
    lazy var loggedArray : [(text : String , image : UIImage , tag : Int )] = [
        (text : YString.personal_information , image : #imageLiteral(resourceName: "personal info") , tag : TAG_PERSONAL_INFO ),
        (text : YString.myAddresses , image : #imageLiteral(resourceName: "address") , tag : TAG_MYADDRESSES ),
        (text : YString.cart , image : #imageLiteral(resourceName: "cart-4") , tag : TAG_CART ),
        (text : YString.savedItem , image : #imageLiteral(resourceName: "wishlist") , tag : TAG_SAVED_ITEMS ),
        (text : YString.myOrders , image : #imageLiteral(resourceName: "my orders") , tag : TAG_MY_ORDERS ),
        (text : YString.myReview , image : #imageLiteral(resourceName: "reviews")  , tag : TAG_MY_REVIEWS ),
        (text : YString.language , image : #imageLiteral(resourceName: "language")  , tag : TAG_LANGUAGE ),
        (text : YString.about , image : #imageLiteral(resourceName: "about") , tag : TAG_ABOUT ),
        (text : YString.terms_privacy , image : #imageLiteral(resourceName: "terms and policy") , tag : TAG_TERMS ),
        (text : YString.customerService , image : #imageLiteral(resourceName: "customer service") , tag : TAG_CUSTOMER_SERVICE ),
        (text : YString.returnPolicy , image : #imageLiteral(resourceName: "return policy")  , tag : TAG_POLICY ),
        (text : YString.saleInBrand , image : #imageLiteral(resourceName: "sell") , tag : TAG_SALE_IN_BRAND ),
        (text : YString.buyFromBrand , image : #imageLiteral(resourceName: "buy")  , tag : TAG_BUY_FROM_BRAND ),
        (text : YString.logout , image : #imageLiteral(resourceName: "logout") , tag : TAG_LOGOUT )
    ]
    
    lazy var notLogedArray : [(text : String , image : UIImage, tag : Int )] = [
        (text : YString.login , image : #imageLiteral(resourceName: "login") , tag : TAG_LOGIN ),
        (text : YString.language , image : #imageLiteral(resourceName: "language") , tag : TAG_LANGUAGE ),
        (text : YString.about , image : #imageLiteral(resourceName: "about") , tag : TAG_ABOUT ),
        (text : YString.terms_privacy , image : #imageLiteral(resourceName: "terms and policy") , tag : TAG_TERMS ),
        (text : YString.customerService , image : #imageLiteral(resourceName: "customer service") , tag : TAG_CUSTOMER_SERVICE ),
        (text : YString.returnPolicy , image : #imageLiteral(resourceName: "return policy") , tag : TAG_POLICY ),
        (text : YString.saleInBrand , image : #imageLiteral(resourceName: "sell") , tag : TAG_SALE_IN_BRAND ),
        (text : YString.buyFromBrand , image : #imageLiteral(resourceName: "logout") , tag : TAG_BUY_FROM_BRAND )
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view = mainView
    }
    
    
}


extension MenuVC_V2 : ButtonActionDelegate {
    
    
    
    
}


extension MenuVC_V2 : UITableViewDelegate , UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (isLogin) ? loggedArray.count : notLogedArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MenuCell.getIdentifier() , for: indexPath) as! MenuCell
        
        let obj = (isLogin) ? loggedArray[indexPath.row] : notLogedArray[indexPath.row]
        cell.selectionStyle = .none
        cell.titleLabel.text = obj.text
        cell.icon.image = obj.image
        if obj.text == YString.language {
            cell.ContainerView.isHidden = false
        }

        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let obj = (isLogin) ? loggedArray[indexPath.row] : notLogedArray[indexPath.row]
        
        switch obj.tag {
        case TAG_PERSONAL_INFO :
            self.present(ProfileVC(), animated: true)
        case TAG_MYADDRESSES :
            self.present(MyAddressViewController(), animated: true)
        case TAG_LOGOUT :
            UserDefaults.standard.set("", forKey: Constants.Defaults.authToken)
            UserDefaults.standard.set(false, forKey: Constants.Defaults.isLogin)
            mainView.tableViewMenu.reloadData()
            self.present(SplashViewController(), animated: true)
        case TAG_LOGIN :
            self.present(LoginViewController(), animated: true)
        case TAG_LANGUAGE :
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "ar" ? "en" : "ar")
            MOLH.reset(transition: .transitionCrossDissolve)
            self.mainView.tableViewMenu.reloadData()
        case TAG_MY_ORDERS :
            self.present(OrderViewController(), animated: true)
        case TAG_MY_REVIEWS :
            self.present(ReviewController(), animated: true)
        case TAG_CART :
            let dest = CartController()
            dest.mainView.navView.backBtn.isHidden = false
            self.present(dest, animated: true)
        case TAG_SAVED_ITEMS :
             self.present(WishListController(), animated: true)
        case TAG_ABOUT :
            return
        default:
            return
        }
        
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    
    
}
