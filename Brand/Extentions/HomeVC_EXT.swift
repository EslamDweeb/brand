//
//  HomeVC_EXT.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arrangedBanners?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? BannerCell else{return UICollectionViewCell()}
        cell.banner = arrangedBanners?[indexPath.row]
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if let url = URL(string: arrangedBanners![indexPath.row].url ) {
            UIApplication.shared.open(url, options: [:])
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
//    override func didUpdateFocus(in context: UIFocusUpdateContext, with coordinator: UIFocusAnimationCoordinator) {
//        if (context.nextFocusedItem != nil) {
//            mainView.bannerCollectionView.scrollToItem(at: context.nextFocusedItem as! IndexPath, at: .centeredHorizontally, animated: true)
//        }
//    }
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        currentIndex = Int(scrollView.contentOffset.x / mainView.bannerCollectionView.frame.size.width)
//        mainView.pageController.currentPage = currentIndex

    }
    
}

