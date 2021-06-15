//
//  MyAddressController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension MyAddressViewController: UITableViewDelegate,UITableViewDataSource {
    func deleteAddress(tableView:UITableView,indexPath:IndexPath){
        APIClient.Deleteaddress(Id:String(self.addresses[indexPath.row].id))
        { (result) in
            switch result {
            case .success(let data):
                    self.createAlert(erroMessage: data.message!)
                    self.addresses.remove(at: indexPath.row)
                    tableView.deleteRows(at: [indexPath], with: .automatic)
            case .failure(let error):
                print(error)
            }
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if addresses.count == 0 {
            
            myAddressView.lable.isHidden = true
            myAddressView.addBtn.isHidden = true
            tableView.backgroundView = MyAddressTableBG()
            
        }
        else{
            myAddressView.addBtn.isHidden = false
            myAddressView.lable.isHidden = false
            tableView.backgroundView = nil
        }
        return addresses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MyAddressCell
        let address = addresses[indexPath.row]
        cell.address = address
        if address.main {
             cell.defaultview.isHidden = false
        }else{
             cell.defaultview.isHidden = true
        }
        if addresses.count == 1 {
            cell.defaultview.isHidden = false
        }
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
         let cell = tableView.cellForRow(at: indexPath) as! MyAddressCell
        
        let deleteBtn = UITableViewRowAction(style: .destructive, title: NSLocalizedString( "delete", comment: "")) { (_, indexPath) in
            if  cell.address?.main ?? false == false {
                self.deleteAddress(tableView:tableView,indexPath:indexPath)
            }else{
                self.createAlert(erroMessage: YString.cantDeleteMainAddress)
            }
        }
        deleteBtn.backgroundColor = .pink
        let editeBtn = UITableViewRowAction(style: .normal, title: NSLocalizedString( "edit", comment: ""), handler: editeAction)
        editeBtn.backgroundColor = .lightGray
        let defaultBtn = UITableViewRowAction(style: .normal, title: NSLocalizedString( "set_default", comment: "")) { (roAction, indexPath) in
            self.setDefault(action: roAction, indexPath: indexPath, tableView: tableView)
        }
        defaultBtn.backgroundColor = .lightgray
        return[deleteBtn,editeBtn,defaultBtn]
    }
    func editeAction(action: UITableViewRowAction, indexPath: IndexPath){
        
        let dest = AddressInfoViewController()
        
        dest.addressedit = self.addresses[indexPath.row]
        self.present(dest, animated: true) {
            // dest.addressView.country.dropView.dropDownOptions = self.cant
            
        }
    }
    func setDefault(action: UITableViewRowAction, indexPath: IndexPath,tableView:UITableView){
        guard let cell = tableView.cellForRow(at: indexPath) as? MyAddressCell else{return}
        if cell.address?.main == false {
            APIClient.Setdefaultaddress(Id: String(self.addresses[indexPath.row].id))
            { (result) in
                switch result {
                case .success( _) :
                    self.addresses[indexPath.row].main = true
                    self.addresses[self.mainIndexPah!].main = false
                    self.mainIndexPah = indexPath.row
                    self .myAddressView.tableView.reloadData()
                case .failure(let error) :
                    print(error)
                }
            }
        }else{
            self.createAlert(erroMessage: YString.thisYourMain)
        }
    }
}
