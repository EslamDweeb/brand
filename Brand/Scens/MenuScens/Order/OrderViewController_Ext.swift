//
//  OrderViewController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/26/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension OrderViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if orders.count == 0 {
//            mainView.myOrders.topAnchor.constraint(equalTo: mainView.navView.bottomAnchor, constant: 0).isActive = true
            mainView.heightConstraint?.constant = 0
            mainView.topConstraint?.constant = 0
            UIView.animate(withDuration: 0.2) {
                self.mainView.layoutIfNeeded()
            }
            collectionView.backgroundView = OrderBackgroundView()
        }else{
            mainView.heightConstraint?.constant = 25
            mainView.topConstraint?.constant = 16
            collectionView.backgroundView = nil
        }
        return orders.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? OrderCell else{ return UICollectionViewCell() }
        cell.order = orders[indexPath.item]
        
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
}
