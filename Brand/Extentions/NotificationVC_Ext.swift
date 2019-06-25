//
//  NotificationVC_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/4/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension NotificationsViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 12
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath) as? NotificationCell else{return UITableViewCell()}
        if indexPath.row == 0 {
            cell.containerView.backgroundColor = .backgroundCell2
            cell.vLineView.isHidden = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
}
