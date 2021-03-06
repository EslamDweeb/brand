//
//  Explore_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension HomeVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if collectionView == mainView.categoriesCollection {
            if toggel == true {
                return categories.count
            }else{
                return brands.count
            }
        }else{
            if toggel == true {
                return brands.count
            }else{
                return categories.count
            }
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.categoriesCollection {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CatogrieCell else{return UICollectionViewCell()}
            if toggel == true {
                cell.category = categories[indexPath.item]
            }else{
                cell.brand = brands[indexPath.item]
            }
            
        return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? BrandCell else {return UICollectionViewCell()}
            if toggel == true {
                 cell.brand = brands[indexPath.item]
            }else{
                cell.category = categories[indexPath.item]
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.categoriesCollection{
            if toggel == true {
                let cell = collectionView.cellForItem(at: indexPath) as? CatogrieCell
                let dest = SubCategoryVC()
                dest.mainView.navView.titlelabel.text = cell?.category?.name
                dest.slug = cell?.category?.slug
                dest.img = ""
                self.present(dest, animated: true, completion: nil)
            }else{
                let cell = collectionView.cellForItem(at: indexPath) as? CatogrieCell
                let dest = SubCategoryVC()
                dest.mainView.navView.titlelabel.text = cell?.brand?.name
                dest.slug = cell?.brand?.slug
                        dest.img = (cell?.brand?.logoImage.path) ?? ""
                self.present(dest, animated: true, completion: nil)
               
            }

        }else if collectionView == mainView.brandCollection{
            if toggel == true {
                let cell = collectionView.cellForItem(at: indexPath) as? BrandCell
                let dest = SubCategoryVC()
                dest.mainView.navView.titlelabel.text = cell?.brand?.name
                dest.slug = cell?.brand?.slug
                dest.img = (cell?.brand?.logoImage.path) ?? ""
                self.present(dest, animated: true, completion: nil)
            }else{
                let cell = collectionView.cellForItem(at: indexPath) as? BrandCell
                let dest = SubCategoryVC()
                dest.mainView.navView.titlelabel.text = cell?.category?.name
                dest.slug = cell?.category?.slug
                 dest.img = ""
                self.present(dest, animated: true, completion: nil)
            }
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.brandCollection {
            let  padding:CGFloat = 8 * 4
            let width = collectionView.frame.width - padding
            let itemWidth = width / 3
        return CGSize(width: itemWidth, height: itemWidth + 4)
        }else{
            return CGSize(width: collectionView.bounds.width / 6 - 16, height:  90)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 8)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 8
    }
}
