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
            if cell.titleLabel.text == "language".localized{
                cell.ContainerView.isHidden = false
            }
        }
        else
        {
            cell.titleLabel.text = NotLoggedArray[indexPath.row]
            cell.icon.image = UIImage(named: notloggedimagesnames[indexPath.row])
            if cell.titleLabel.text == "language".localized{
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
        case "personal_information".localized:
            self.present(ProfileVC(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "myAddresses".localized:
            self.present(MyAddressViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "logout".localized:
            UserDefaults.standard.set("", forKey: Constants.Defaults.authToken)
            UserDefaults.standard.set(false, forKey: Constants.Defaults.isLogin)
            mainView.newTable.reloadData()
            self.present(SplashViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "login".localized:
            let dest = LoginViewController()
            dest.loginView.closeImg.isHidden = false
            self.present(dest, animated: true) {
                cell.backgroundColor = .clear
            }
            
        case "language".localized:
            // NSLocalizedString("localize me please" , comment: "")
            MOLH.setLanguageTo(MOLHLanguage.currentAppleLanguage() == "ar" ? "en" : "ar")
            MOLH.reset(transition: .transitionCrossDissolve)
            self.mainView.newTable.reloadData()
        case "myOrders".localized:
            self.present(OrderViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "myReview".localized:
            self.present(ReviewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "cart".localized:
            let dest = CartController()
            dest.mainView.navView.backBtn.isHidden = false
            self.present(dest, animated: true) {
                cell.backgroundColor = .clear
            }
        case "wishlist".localized:
            self.present(WishListController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "about".localized:
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "terms&privacy".localized:
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "customerService".localized:
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "returnPolicy".localized:
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "saleInBrand".localized:
            self.present(LoginViewController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case "buyFromBrand".localized:
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
