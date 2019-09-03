//
//  Cart_Ex.swift
//  Brands
//
//  Created by Nada Dyaa on 3/6/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension CartController: UITableViewDelegate , UITableViewDataSource {
    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard shouldShowLoadingCell else { return false }
        return indexPath.row == self.cartpro.count
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) == "" && cartpro.count == 0{
            mainView.heightConstrain?.constant = 0
            mainView.Totalsar.isHidden = true
            mainView.ItemsNum.isHidden = true
            mainView.save.isHidden = true
            tableView.separatorStyle = .none
            let view = CartTableBG(delegate: self)
            view.startbtn.isHidden = false
            view.lable.text = YString.pleseLoginFirst
            tableView.backgroundView = view
        }else if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != "" && cartpro.count == 0{
            mainView.heightConstrain?.constant = 0
            mainView.Totalsar.isHidden = true
            mainView.ItemsNum.isHidden = true
            mainView.save.isHidden = true
            tableView.separatorStyle = .none
            let view = CartTableBG(delegate: self)
            view.lable.text = YString.yourCartIsEmpty
            tableView.backgroundView = view
        }else{
            self.mainView.ItemsNum.text = "\("Items".localized )\(self.cartpro.count)"
            self.mainView.Totalsar.text = "\("totalPrice".localized) \(self.getTotalCartItemsPrice()) \("sar".localized)"
            //            mainView.bottomConstrain?.constant = CGFloat(165 * cartpro.count)
            mainView.heightConstrain?.constant = 20
            mainView.Totalsar.isHidden = false
            mainView.ItemsNum.isHidden = false
            mainView.save.isHidden = false
            tableView.backgroundView = nil
            tableView.backgroundView = nil
        }
        let count = cartpro.count
        return shouldShowLoadingCell ? count + 1 : count
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteBtn = UITableViewRowAction(style: .destructive, title: YString.delete ) { (_, indexPath) in
          //  self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.deleteCart(id: self.cartpro[indexPath.row].id, complition:{ (result) in
                switch result{
                case.success(let data):
                    print(data)
                    DispatchQueue.main.async {
                        self.cartpro.remove(at: indexPath.row)
                   //     tableView.deleteRows(at: [indexPath], with: .automatic)
                        tableView.reloadData()
                      //  self.mainView.activityStopAnimating()
                    }
                    print (data)
                case .failure(let error):
                    print(error)
                   // self.mainView.activityStopAnimating()
                }
            })
           
        }
        deleteBtn.backgroundColor = .pink
        let editeBtn = UITableViewRowAction(style: .normal, title: YString.edit , handler: editAction )
        editeBtn.backgroundColor = .lightGray
        
        return[deleteBtn,editeBtn]
    }
    func editAction(action: UITableViewRowAction, indexPath: IndexPath){
        
        self.parent?.addViewAddToCart(cartItem: self.cartpro[indexPath.row] )
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! CartCell
        if isLoadingIndexPath(indexPath) {
            return cell
        } else {
        let cart = cartpro[indexPath.row]
        cell.cart = cart
        if cart.sellerNotes == nil {
            cell.infoBtn.isHidden = true 
        }
        cell.selectionStyle = .none
        cell.infoBtn.tag = indexPath.row
        cell.infoBtn.addTarget(self, action: #selector(ButtonActionDelegate.infoTapped(_:)), for: .touchUpInside)

        }
//        mainView.ItemsNum.text = "\("Items".localized )\(cartpro.count)"
//        mainView.Totalsar.text = "\("TotalAmount".localized) \(self.getTotalCartItemsPrice())"
        return cell
    }
//    override func updateViewConstraints() {
//        
//        self.mainView.tableView.heightAnchor.constraint(equalToConstant: self.mainView.tableView.contentSize.height + 50 ).isActive = true
//        super.updateViewConstraints()
//    }
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        guard isLoadingIndexPath(indexPath) else { return }
        fetchNextPage()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dest = ItemDetailVC()
        dest.slug = cartpro[indexPath.row].config.slug
        self.present(dest, animated: true, completion: nil )
    }
}
