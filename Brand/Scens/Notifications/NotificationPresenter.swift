//
//  NotificationPresenter.swift
//  Brand
//
//  Created by iOS on 8/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


protocol ProNotificationView {
    func getNotifications ()
}

protocol ProNotificationPresenter {
    var listNotifications : [NotificationModel] { get set }
    func getNotifications()
    func resetData()
}

class NotificationPresenter : ProNotificationPresenter {
    
    var listNotifications: [NotificationModel] = []
    var notificationView: ProNotificationView!
    var currentPage: Int = 0
    var lastPage: Int = 1
    var paginate: Bool = false
    
    init(notificationView : ProNotificationView) {
        self.notificationView = notificationView
    }
    
    
    func resetData() {
        listNotifications = []
        currentPage = 0
        lastPage = 1
        paginate = false
    }
    
    func getNotifications() {
        if currentPage >= lastPage {
            return
        }
        if paginate {
            return
        }
        self.paginate = true
        currentPage += 1
        APIClient.getNotifications(page: currentPage ) { (result ) in
            switch result {
            case .success(let data ) :
                self.listNotifications += data.notifications
                self.currentPage = data.meta.currentPage ?? 1
                self.lastPage = data.meta.lastPage ?? 1
                self.paginate = false
                self.notificationView.getNotifications()
                
                return
            case .failure(let errors) :
                print("errors : \(errors.localizedDescription)")
                return
            }
        }
    }
    
    
    
}
