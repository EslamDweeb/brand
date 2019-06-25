//
//  MyAddressController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension MyAddressViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if addresses.count == 0 {
            
            myAddressView.lable.isHidden = true
            myAddressView.addBtn.isHidden = true
            //  tableView.backgroundView = MyAddressTableBG()
            
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
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteBtn = UITableViewRowAction(style: .destructive, title: NSLocalizedString( "delete", comment: "")) { (_, indexPath) in
            APIClient.Deleteaddress(Id:String(self.addresses[indexPath.row].id))
            { (result) in
                switch result {
                case .success(let data):
                    print(data)
                    print("Delete add")
                case .failure(let error):
                    print(error)
                }
            }
            self.addresses.remove(at: indexPath.row)
            if self.addresses.count != 0 {
                let  cell  = self.myAddressView.tableView.cellForRow(at: indexPath) as! MyAddressCell
                if cell.defaultview.isHidden == false {
                    let  cell  = self.myAddressView.tableView.cellForRow(at: [0,indexPath.row + 1] )as! MyAddressCell
                    cell.defaultview.isHidden = false
                }
            }
            tableView.deleteRows(at: [indexPath], with: .automatic)
        }
        deleteBtn.backgroundColor = .pink
        let editeBtn = UITableViewRowAction(style: .normal, title: NSLocalizedString( "edit", comment: ""), handler: editeAction)
        editeBtn.backgroundColor = .lightGray
        let defaultBtn = UITableViewRowAction(style: .normal, title: NSLocalizedString( "set_default", comment: ""), handler: setDefault)
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
    func setDefault(action: UITableViewRowAction, indexPath: IndexPath){
        
        APIClient.Setdefaultaddress(Id: String(self.addresses[indexPath.row].id))
        { (result) in
            switch result {
            case .success(let data) :
                
                print(data)
                print("Set default")
                
            case .failure(let error) :
                print(error)
                
            }
        }
        print(indexPath)
        for i in 0...addresses.count-1 {
            let  cell  = self.myAddressView.tableView.cellForRow(at: [0,i]) as! MyAddressCell
            if i == indexPath.row {
                cell.defaultview.isHidden = false
            }else{
                cell.defaultview.isHidden = true
            }
        }
        
    }
}
