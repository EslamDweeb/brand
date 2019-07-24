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
          
         //   mainView.heightConstrain?.constant = 0
         //   mainView.bottomConstrain?.constant = view.frame.width + 100
            mainView.Totalsar.isHidden = true
            mainView.ItemsNum.isHidden = true
            mainView.save.isHidden = true
            tableView.backgroundView = CartTableBG()
        }
        else{
           // mainView.bottomConstrain?.constant = CGFloat(165 * cartpro.count)
           // mainView.heightConstrain?.constant = 20
            mainView.Totalsar.isHidden = false
            mainView.ItemsNum.isHidden = false
            mainView.save.isHidden = false
            tableView.backgroundView = nil
        }
       
        return cartpro.count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteBtn = UITableViewRowAction(style: .destructive, title: "Delete") { (_, indexPath) in
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
        mainView.ItemsNum.text = "\(cartpro.count)"
        mainView.Totalsar.text = self.getTotalCartItemsPrice()
        return cell
    }
//    override func updateViewConstraints() {
//        
//        self.mainView.tableView.heightAnchor.constraint(equalToConstant: self.mainView.tableView.contentSize.height + 50 ).isActive = true
//        super.updateViewConstraints()
//    }
    
}
