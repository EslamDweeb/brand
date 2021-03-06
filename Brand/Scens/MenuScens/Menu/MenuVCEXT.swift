//
//  MenuVCEXT.swift
//  Brands
//
//  Created by IOS on 3/14/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH
import SafariServices

enum WebControllType{
    case about
    case terms
    case customerService
    case returnPolicy
    case saleOnBrand
    case buyOnbrand
}

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
        case YString.savedItem:
            self.present(WishListController(), animated: true) {
                cell.backgroundColor = .clear
            }
        case YString.about:
            setControllerTitleAndLoad(type:.about, cell: cell)
        case YString.termsAndPrivacy:
            setControllerTitleAndLoad(type:.terms, cell: cell)
        case YString.customerService:
          setControllerTitleAndLoad(type:.customerService, cell: cell)
        case YString.returnPolicy:
           setControllerTitleAndLoad(type:.returnPolicy, cell: cell)
        case YString.saleOnBrand:
            setControllerTitleAndLoad(type:.saleOnBrand, cell: cell)
        case YString.buyFromBrand:
           setControllerTitleAndLoad(type:.buyOnbrand, cell: cell)
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

extension MenuViewController{
    enum UrlPath:String{
        case about = "about"
        case terms = "terms"
        case customerService = "customer-service"
        case returnPolicy = "return-policy"
        case saleOnBrand = "sale-on-brands"
        case buyFromBrand = "buy-from-brands"
    }
    func setControllerTitleAndLoad(type:WebControllType,cell:MenuCell?){
        switch type {
        case .about:
            self.loadWebView(path: UrlPath.about.rawValue, cell: cell)
        case .terms:
            self.loadWebView(path: UrlPath.terms.rawValue, cell: cell)
        case .customerService:
            self.loadWebView(path: UrlPath.customerService.rawValue, cell: cell)
        case .returnPolicy:
            self.loadWebView(path: UrlPath.returnPolicy.rawValue, cell: cell)
        case .saleOnBrand:
            self.loadWebView(path: UrlPath.saleOnBrand.rawValue, cell: cell)
        case .buyOnbrand:
            self.loadWebView(path: UrlPath.buyFromBrand.rawValue, cell: cell)
        }
    }
    func loadWebView(path:String,cell:MenuCell?){
        let url = URL(string: "https://brands.sa/\(path)")!
        let dest = SFSafariViewController(url: url)
        self.present(dest, animated: true) {
            cell!.backgroundColor = .clear
        }
    }
}
