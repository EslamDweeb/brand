//
//  NotificationVC_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension NotificationsViewController: UITableViewDataSource,UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        
        if (presenter?.listNotifications.count ?? 0) > 0 &&  indexPath.row >= (presenter?.listNotifications.count ?? 0) - 3 {
            presenter?.getNotifications()
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.listNotifications.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as! NotificationCell
        let obj = presenter?.listNotifications[indexPath.row]
        if !(obj?.isRead ?? true)  {
            cell.containerView.backgroundColor = .backgroundCell2
            cell.vLineView.isHidden = false
        }
        cell.messageLable.text = obj?.message
        cell.dateLable.text = obj?.createdAt.date
       
        return cell
    }
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return 60
//    }
    
}

extension NotificationsViewController : ProNotificationView {
    
    func getNotifications() {
        mainView.tableView.reloadData()
    }
    
}
