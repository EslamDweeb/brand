//
//  ShippingVCExt.swift
//  Brand
//
//  Created by nada dyaa on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
extension ShippingVC  :  UICollectionViewDelegateFlowLayout  , UICollectionViewDelegate , UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if shippingMethodarr.count != 0 {
            if shippingMethodarr.count % 3 != 0 {
                mainView.HeightConstrain?.constant = CGFloat(Int (((shippingMethodarr.count) / 3 ) * 100)) + 100
            }else{
              mainView.HeightConstrain?.constant = CGFloat(Int (((shippingMethodarr.count) / 3 ) * 100))
            }
            mainView.HeightConstrain?.constant = CGFloat(Int (((shippingMethodarr.count  ) / 3 ) * 100))
        }else {
             mainView.HeightConstrain?.constant = 0
        }
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
        return shippingMethodarr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? ShippingMethodCell else {
            return UICollectionViewCell()
        }
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
        cell?.defaultview.isHidden  = false
    }
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? ShippingMethodCell
        cell?.defaultview.isHidden  = true
    }


}
