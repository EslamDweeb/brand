//
//  TabBarViewController.swift
//  Brands
//
//  Created by IOS on 3/7/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class TabBarViewController: UITabBarController {
    let indetifer = "ExploreVC"
    let MenuViewControllers = MenuViewController()
    let ExploreViewControllers = HomeVC()
    let HomeViewControllers = ExploreVC()
    let NotificationViewControllers = NotificationsViewController()
    let CartViewControllers = CartController()
    var homebtn: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(named: "home"), for: .normal)
        return button
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.selectedIndex = 2
        tabBar.tintColor = .pink
        AddVC()
        self.view.addSubview(homebtn)
        
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        let height =  ( self.tabBar.frame.size.height / 2 ) - 5
        let bottomPadding : CGFloat = self.view.safeAreaInsets.bottom / 2
        
        //print("height tab : \(height)")
        //print("height safe area : \(bottomPadding)")
        homebtn.translatesAutoresizingMaskIntoConstraints = false
        homebtn.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 0 , paddingLeft: 0, paddingBottom: height + bottomPadding  , paddingRight: 0, width: 50 , height: 50 , paddingCenterX: 0 , paddingCenterY: 0)
        homebtn.addTarget(self, action: #selector(homeBtnTapped), for: .touchUpInside)
    }
    
    @objc func homeBtnTapped(){
        self.selectedIndex = 2
    }
    func AddVC(){
        //        self.navigationController?.navigationBar.isHidden = true
        MenuViewControllers.tabBarItem = UITabBarItem(title: YString.menu , image: #imageLiteral(resourceName: "Setting"), tag: 0)
        MenuViewControllers.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.0);
//        ExploreViewControllers.tabBarItem = UITabBarItem(title:
//            NSLocalizedString("explore", comment: ""), image:#imageLiteral(resourceName: "compassAnticon"), tag: 1)
//        ExploreViewControllers.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.0);
        HomeViewControllers.tabBarItem = UITabBarItem(title:"explore".localized, image:#imageLiteral(resourceName: "compassAnticon") , tag: 1)
        HomeViewControllers.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.0);
        NotificationViewControllers.tabBarItem = UITabBarItem(title:"notification".localized, image: #imageLiteral(resourceName: "notificationAnticon"), tag: 3)
        NotificationViewControllers.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.0);
        CartViewControllers.tabBarItem = UITabBarItem(title:"cart".localized, image: #imageLiteral(resourceName: "shoppingCartAnticon"), tag: 4)
        CartViewControllers.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -4.0);
        let viewControllerList = [ HomeViewControllers,NotificationViewControllers,ExploreViewControllers,CartViewControllers,MenuViewControllers]
        viewControllers = viewControllerList
    }
}
