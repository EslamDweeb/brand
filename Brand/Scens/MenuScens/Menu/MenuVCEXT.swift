//
//  MenuVCEXT.swift
//  Brands
//
//  Created by IOS on 3/14/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

extension MenuViewController : UITableViewDataSource , UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(mainView.isLogin == true)
        {
            return LoggedArray.count
        }
        else
        {
            return NotLoggedArray.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellid, for: indexPath) as? MenuCell else{return UITableViewCell()}
        cell.selectionStyle = .none        
        if(mainView.isLogin == true)
        {
            cell.titleLabel.text = LoggedArray[indexPath.row]
            cell.icon.image = UIImage(named: loggedimagesnames[indexPath.row])
            if cell.titleLabel.text == NSLocalizedString( "language", comment: ""){
                cell.ContainerView.isHidden = false
            }
        }
        else
        {
            cell.titleLabel.text = NotLoggedArray[indexPath.row]
            cell.icon.image = UIImage(named: notloggedimagesnames[indexPath.row])
            if cell.titleLabel.text == NSLocalizedString( "language", comment: ""){
                cell.ContainerView.isHidden = false
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let cell = tableView.cellForRow(at: indexPath) as? MenuCell else{return}
        var labelname : String!
        if(mainView.isLogin == true)
        {
            labelname = LoggedArray[indexPath.row]
        }else
        {
            labelname = NotLoggedArray[indexPath.row]
        }
        if cell.isSelected {cell.backgroundColor = .pink} else {cell.backgroundColor = .clear}
        cell.titleLabel.text = labelname
        switch labelname {
        case NSLocalizedString( "personal_information", comment: ""):
            self.present(ProfileVC(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "myAddresses", comment: ""):
            self.present(MyAddressViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "logout", comment: ""):
            UserDefaults.standard.set("", forKey: Constants.Defaults.authToken)
            UserDefaults.standard.set(false, forKey: Constants.Defaults.isLogin)
            mainView.newTable.reloadData()
            self.present(SplashViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "login", comment: ""):
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
            
        case NSLocalizedString( "language", comment: ""):
            // NSLocalizedString("localize me please" , comment: "")
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "ar" ? "en" : "ar")
            MOLH.reset(transition: .transitionCrossDissolve)
            self.mainView.newTable.reloadData()
        case NSLocalizedString( "myOrders", comment: ""):
            self.present(OrderViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "myReview", comment: ""):
            self.present(ReviewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "cart", comment: ""):
            self.present(CartController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "wishlist", comment: ""):
            self.present(WishListController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "about", comment: ""):
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "terms&privacy", comment: ""):
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "customerService", comment: ""):
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "returnPolicy", comment: ""):
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "saleInBrand", comment: ""):
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case NSLocalizedString( "buyFromBrand", comment: ""):
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        default:
            break
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cell = tableView.cellForRow(at: indexPath) as? MenuCell else{return}
        cell.backgroundColor = .clear
    }
}
