//
//  Cart_Ex.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension CartController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if cartpro.count == 0 {
            cartv.tableView.bottomAnchor.constraint(equalTo: cartv.bottomAnchor, constant: 0).isActive = true
           
            cartv.Totalsar.isHidden = true
            cartv.ItemsNum.isHidden = true
            cartv.save.isHidden = true
            tableView.backgroundView = CartTableBG()
        }
        else{
            cartv.Totalsar.isHidden = false
            cartv.ItemsNum.isHidden = false
            cartv.save.isHidden = false
            tableView.backgroundView = nil
        }
       
        return cartpro.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteBtn = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
            
//            _  = self.cartv.tableView.cellForRow(at: indexPath) as! CartCell
            self.cartpro.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteBtn.backgroundColor = .pink
        let editeBtn = UITableViewRowAction(style: .normal, title: "Edite", handler: editeAction)
        editeBtn.backgroundColor = .lightGray
        
        return[deleteBtn,editeBtn]
    }
    func editeAction(action: UITableViewRowAction, indexPath: IndexPath){
            
        }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CartCell
        let cart = cartpro[indexPath.row]
        cell.cart = cart
        return cell
    }
    
    
}
