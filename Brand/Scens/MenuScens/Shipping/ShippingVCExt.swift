//
//  ShippingVCExt.swift
//  Brand
//
//  Created by nada dyaa on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
extension ShippingVC  :  UICollectionViewDelegateFlowLayout  , UICollectionViewDelegate , UICollectionViewDataSource , UITableViewDelegate,UITableViewDataSource {
   
    
   
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
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
        return 110
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defaultaddress = addresses[indexPath.row]
        self.addresses[indexPath.row].main = true
        self.addresses[self.mainIndexPah!].main = false
        self.mainIndexPah = indexPath.row
        self.mainView.tableView.reloadData()
        self.mainView.addressName.text = defaultaddress?.addressName
        if defaultaddress?.detailedAddress != nil {
            self.mainView.addressDescription.text = "\(defaultaddress?.country.name ?? "hhh")-  \(defaultaddress?.state.name ?? "")-\(defaultaddress?.city)-\(defaultaddress?.detailedAddress!)"
        }else{
            self.mainView.addressDescription.text = "\(defaultaddress!.country.name ?? "hhhh")- \(defaultaddress!.state.name ?? "")-\(defaultaddress!.city)"
            
        }
      //  self.mainView.addressDescription.text =  defaultaddress?.detailedAddress
        self.activeShippingMethod = self.checkShippingMethod()
        self.mainView.shippingCollectionview.reloadData()
        animateTransitionIfNeeded(state: nextState)
        
    }
    
//    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
//        mainView.HeightConstrain?.constant = collectionView.contentSize.height + 10
//    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if shippingMethodarr.count != 0 {
            if shippingMethodarr.count % 3 != 0 {
                mainView.HeightConstrain?.constant = CGFloat(Int (((shippingMethodarr.count) / 3 ) * 100)) + 110
            }else{
              mainView.HeightConstrain?.constant = CGFloat(Int (((shippingMethodarr.count) / 3 ) * 100)) + 10
            }
            
           // mainView.HeightConstrain?.constant = CGFloat(Int (((shippingMethodarr.count  ) / 3 ) * 100))
        }else {
             mainView.HeightConstrain?.constant = 0
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
        return shippingMethodarr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ShippingMethodCell else {
            return UICollectionViewCell()
        }
        if self.activeShippingMethod[indexPath.row] {
            cell.view.backgroundColor = .white
        }else {
            cell.view.backgroundColor = .lightgray
        }
        cell.defaultview.isHidden = true
        cell.name = shippingMethodarr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 3 - 8 , height: 100 )
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ShippingMethodCell
        if self.activeShippingMethod[indexPath.row] {
             cell?.defaultview.isHidden  = false
             self.MianShippingID = shippingMethodarr[indexPath.row].id
        }else{
            cell?.defaultview.isHidden  = true
             self.MianShippingID = nil
        }
        }
        
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ShippingMethodCell
        cell?.defaultview.isHidden  = true
    }


}
