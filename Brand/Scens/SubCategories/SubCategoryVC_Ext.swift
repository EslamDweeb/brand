//
//  SubCategoryVC_Ext.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/7/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension SubCategoryVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return subCategories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.categoriesCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CatogrieCell else{return UICollectionViewCell()}
            cell.category = subCategories[indexPath.item]
//            if toggel == false {
//                cell.category = categories[indexPath.item]
//            }else{
//                cell.brand = brands[indexPath.item]
//            }
            
            return cell
        }else{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? WishCell else {return UICollectionViewCell()}
//            if toggel == false {
//                cell.brand = brands[indexPath.item]
//            }else{
//                cell.category = categories[indexPath.item]
//            }
            return cell
        }
    }
    
    
}
