//
//  Notifications.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class NotificationsViewController:UIViewController {
    
    var presenter : ProNotificationPresenter?
    
    let cellID = "cellID"
    lazy var mainView:NotificationView = {
        let v = NotificationView(delegate: self, dataSource: self)
        return v
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
        presenter = NotificationPresenter(notificationView: self ) // implement protocol  ProNotificationView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter?.resetData()
        presenter?.getNotifications()
    }
}
