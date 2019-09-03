//
//  WishListController_Ext.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

extension WishListController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
   
    private func isLoadingIndexPath(_ indexPath: IndexPath) -> Bool {
        guard shouldShowLoadingCell else { return false }
        return indexPath.row == self.wishes.count
    }
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
            case .seeAll:
               //  collectionView.backgroundView = nil
                    let view = ReviewBGView()
                    view.image.image = #imageLiteral(resourceName: "No product")
                    view.lable.text = "NO Result"
                    view.backgroundColor = .clear
                    collectionView.backgroundView = view
            }
        }else{
            collectionView.backgroundView = nil
        }
        let count = wishes.count
        return shouldShowLoadingCell ? count + 1 : count
       // return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID , for: indexPath) as? WishCell else{return UICollectionViewCell () }
        if isLoadingIndexPath(indexPath) {
            return cell
        } else {
            cell.config = wishes[indexPath.row]
            switch vcType{
            case .wishList:
                break
               // let image = UIImage(named: "invalidName")
               // cell.favBtn.setImage(image, for: .normal)
            case .allProduct:
                let image = UIImage(named: "wish")
                cell.favBtn.setImage(image, for: .normal)
            case .seeAll:
                break
            }
            cell.handelFavBtnTapped = { [weak self] (id) in
                guard let self = self else{return}
                APIClient.toggleFav(id: id) { (result) in
                    switch result {
                    case.success(let data):
                        self.createAlert(title: nil, erroMessage: data.message ?? "", createButton: nil)
                        self.wishes.remove(at: indexPath.row)
                        collectionView.reloadData()
                        self.removeAlertController()
                        print(data)
                    case .failure(_):
                        break
                    }
                }
            }
            return cell
        }
    }
    func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            sizeForItemAt indexPath: IndexPath) -> CGSize {
            if collectionView == mainView.wishCollection {
                return CGSize(width: (collectionView.bounds.width / 2) - 16, height: 210)
            }else{
                return collectionView.bounds.size
            }
        }
        func collectionView(_ collectionView: UICollectionView,
                            layout collectionViewLayout: UICollectionViewLayout,
                            insetForSectionAt section: Int) -> UIEdgeInsets {
            if collectionView == mainView.wishCollection {
                 return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
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
                return 8
            }else{
                return .zero
            }
        }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         guard isLoadingIndexPath(indexPath) else { return }
         fetchNextPage()
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let cell = collectionView.cellForItem(at: indexPath)as? WishCell else{return}
        let dest = ItemDetailVC.create(slug: cell.config?.slug ?? "")
        self.present(dest, animated: true, completion: nil)
    }
}
