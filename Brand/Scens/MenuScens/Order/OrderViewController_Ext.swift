//
//  OrderViewController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension OrderViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard shouldShowLoadingCell else { return false }
         if mainView.line1.isHidden == false {
             return indexPath.row == self.ordersPending.count - 1
         }else if mainView.line1.isHidden == false {
            return indexPath.row == self.ordersDelivered.count - 1
         }
         else {
            return indexPath.row == self.ordersOthers.count - 1
        }
       // return indexPath.row == self.orders.count
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //        if orders.count == 0 {
        //
        //            mainView.heightConstraint?.constant = 0
        //            mainView.topConstraint?.constant = 0
        //            UIView.animate(withDuration: 0.2) {
        //                self.mainView.layoutIfNeeded()
        //            }
        //            collectionView.backgroundView = OrderBackgroundView()
        //        }else{
        //            mainView.heightConstraint?.constant = 25
        //            mainView.topConstraint?.constant = 16
        //            collectionView.backgroundView = nil
        //        }
        if mainView.line1.isHidden == false {
            if ordersPending.count == 0 {
                let view = OrderBackgroundView()
                view.image.image = #imageLiteral(resourceName: "Asset 32")
                view.lable.text  = "There is no pending orders"
                collectionView.backgroundView = view
            }else {
                collectionView.backgroundView  = nil
            }
            let count = ordersPending.count
            return shouldShowLoadingCell ? count   : count
        }else if mainView.line2.isHidden == false {
            let count = ordersDelivered.count
            if ordersDelivered.count == 0 {
                let view = OrderBackgroundView()
                view.image.image = #imageLiteral(resourceName: "Asset 35")
                view.lable.text  = "There is no delivered orders"
               collectionView.backgroundView = view
            }else {
                collectionView.backgroundView  = nil
            }
            return shouldShowLoadingCell ? count : count
        }else{
            if ordersOthers.count == 0 {
                let view = OrderBackgroundView()
                view.image.image = #imageLiteral(resourceName: "Asset 34")
                view.lable.text  = "There is no canceled or returned orders"
                collectionView.backgroundView = view
            }else {
                collectionView.backgroundView  = nil
            }
            let count = ordersOthers.count
            return shouldShowLoadingCell ? count  : count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? OrderCell else{ return UICollectionViewCell() }
        if isLoadingIndexPath(indexPath) {
            return cell
        } else {
            if mainView.line1.isHidden == false {
                cell.order = ordersPending[indexPath.row]
            }else if mainView.line2.isHidden == false {
                cell.order = ordersDelivered[indexPath.item]
            }else{
                cell.order = ordersOthers[indexPath.item]
            }
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let dest = DetailorderVC()
        dest.orderSerial = orders[indexPath.row].referenceNumber
        self.presentViewController(controller: dest, transitionModal: UIModalTransitionStyle.crossDissolve, presentationStyle: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height:120)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .zero
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        guard isLoadingIndexPath(indexPath) else { return }
        fetchNextPage()  
    }}
