//
//  HomeVC_EXT.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension HomeViewController:UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        if collectionView == mainView.mainCollection {
            return 3
        }else{
            return 1
        }
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.bannerCollectionView{
            return arrangedBanners?.count ?? 0
        }else if collectionView == mainView.mainCollection{
            if section == 0 {
                let x = recomendedCount
                print(x)
                return (exploreData?.recommended?.count ?? 0) - x
            }else if section == 1 {
                let x = latestCount
                print(x)
                return (exploreData?.latest?.count ?? 0) - x
            }else{
                let x = popularCount
                print(x)
                return (exploreData?.popular?.count ?? 0) - x
            }
        }
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.bannerCollectionView{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? BannerCell else{return UICollectionViewCell()}
            cell.banner = arrangedBanners?[indexPath.row]
            return cell
        }else{
             guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ExploreCell else{return UICollectionViewCell()}
            cell.delegate = self
            if indexPath == IndexPath(row: 0, section: 0){
                cell.titleLabel.text = titleArray[indexPath.section]
                cell.configArray = exploreData?.recommended ?? []
            }
            if indexPath == IndexPath(row: 0, section: 1){
                cell.titleLabel.text = titleArray[indexPath.section]
                cell.configArray = exploreData?.latest ?? []
            }
            if indexPath == IndexPath(row: 0, section: 2){
                cell.titleLabel.text = titleArray[indexPath.section]
                cell.configArray = exploreData?.popular ?? []
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.bannerCollectionView{
            if let url = URL(string: arrangedBanners![indexPath.row].url ?? "" ) {
                UIApplication.shared.open(url, options: [:])
            }
        }else{
                print("HI!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!")
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.bannerCollectionView{
            return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
        }else{
            return CGSize(width: mainView.frame.width, height: 300)
        }
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
        if scrollView == mainView.bannerCollectionView{
        currentIndex = Int(scrollView.contentOffset.x / mainView.bannerCollectionView.frame.size.width)
        }
//        mainView.pageController.currentPage = currentIndex
    }
    
}

extension HomeViewController:ExploreCellDelegate{
    func presentController(slug: String) {
        let dest = ItemDetailVC()
        dest.slug = slug
        self.present(dest, animated: true, completion: nil)
    }
}
