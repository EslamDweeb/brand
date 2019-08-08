//
//  WishListController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension WishListController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if wishes.count == 0 {
            switch vcType{
            case .wishList:
                collectionView.backgroundView = CellBackgroundView(delegate: self)
            case .allProduct:
                let view = CellBackgroundView(delegate: self)
                view.lable.text = "New Products"
                view.button.isHidden = true
                collectionView.backgroundView = view
            }
        }else{
            collectionView.backgroundView = nil
        }
        return wishes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID , for: indexPath) as? WishCell else{return UICollectionViewCell () }
        cell.config = wishes[indexPath.row]
        switch vcType{
        case .wishList:
            let image = UIImage(named: "invalidName")
            cell.favBtn.setImage(image, for: .normal)
        case .allProduct:
            let image = UIImage(named: "wish")
            cell.favBtn.setImage(image, for: .normal)
        }
        return cell
    }
        fileprivate var sectionInsets: UIEdgeInsets {
            return .zero
        }
        fileprivate var itemsPerRow: CGFloat {
            return 2
        }
        fileprivate var interitemSpace: CGFloat {
            return 8.0
        }
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == mainView.wishCollection {
                let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
                let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
                let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
                let widthPerItem = availableWidth / itemsPerRow
                return CGSize(width: widthPerItem, height: widthPerItem + 30)
            }else{
                return collectionView.bounds.size
            }
        }
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            if collectionView == mainView.wishCollection {
                 return sectionInsets
            }else{
                return .zero
            }
        }
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == mainView.wishCollection {
                return 8.0
            }else{
                return .zero
            }
        }
    
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
            if collectionView == mainView.wishCollection {
                return interitemSpace
            }else{
                return .zero
            }
        }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if (wishes.count - 1 ) <= indexPath.row {
            self.infinitePaging()
        }else{return}
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let dest = ItemDetailVC()
        dest.slug = slug
        self.present(dest, animated: true, completion: nil)
    }
    
}
