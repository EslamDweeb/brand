//
//  billingVCExt.swift
//  Brand
//
//  Created by nada dyaa on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import Foundation
import UIKit
extension BillingVC  :  UICollectionViewDelegateFlowLayout  , UICollectionViewDelegate , UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if billingMethodarr.count != 0 {
            if billingMethodarr.count % 2 != 0 {
                mainView.hieghtConstrainView?.constant = CGFloat(Int (((billingMethodarr.count) / 2 ) * 100)) + 120
            }else{
                mainView.hieghtConstrainView?.constant = CGFloat(Int (((billingMethodarr.count) / 2 ) * 100)) + 20
            }
            mainView.hieghtConstrainView?.constant = CGFloat(Int (((billingMethodarr.count  ) / 2 ) * 100)) + 20
        }else {
            mainView.hieghtConstrainView?.constant = 0
        }
        UIView.animate(withDuration: 0.3, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
        return billingMethodarr.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as? BillingMethodCell else {
            return UICollectionViewCell()
        }
        cell.defaultview.isHidden = true
        cell.name = billingMethodarr[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8 , height: 100 )
        
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return  4
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? BillingMethodCell
       
            cell?.defaultview.isHidden  = false
          self.MianbillingID = billingMethodarr[indexPath.row].id
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? BillingMethodCell
        cell?.defaultview.isHidden  = true
    }
    
    
}
