//
//  ReviewController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension ReviewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if reviews.count == 0 {
            mainView.heightConstraint?.constant = 0
            mainView.topConstraint?.constant = 0
            UIView.animate(withDuration: 0.2) {
                self.mainView.layoutIfNeeded()
            }
            collectionView.backgroundView = ReviewBGView()
        }else{
            mainView.heightConstraint?.constant = 25
            mainView.topConstraint?.constant = 16
            collectionView.backgroundView = nil
        }
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ReviewCell else{ return UICollectionViewCell() }
        cell.review = reviews[indexPath.item]
        cell.editeBtnTapped = { [weak self]  (review) in
            let dest = AddReviewController()
            dest.mainView.review = review
            dest.mainView.headerView.rateView.settings.updateOnTouch = true
            self?.dismissPressentededControllers()
            self?.presentViewController(controller: dest, transitionModal: UIModalTransitionStyle.crossDissolve, presentationStyle: nil)
        }
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath) as? ReviewCell else{return}
        let dest = AddReviewController()
        dest.mainView.review = cell.review
        dest.mainView.reviewView.textView.isUserInteractionEnabled = false
        dest.mainView.prosView.textView.isUserInteractionEnabled = false
        dest.mainView.consView.textView.isUserInteractionEnabled = false
        self.presentViewController(controller: dest, transitionModal: UIModalTransitionStyle.coverVertical, presentationStyle: nil)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
      
        return CGSize(width: collectionView.frame.width, height:150)
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
