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
        if collectionView == mainView.categoriesCollection{
            if subCategories.count != 0 {
                self.mainView.heightforlable?.constant = 30
                self.mainView.heightforSubCat?.constant = 90
//                UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
//                    self.mainView.layoutIfNeeded()
//                }, completion: nil)
                
            }else{
                self.mainView.heightforlable?.constant = 0
                self.mainView.heightforSubCat?.constant = 0
                UIView.animate(withDuration: 0.2, delay: 0, options: .curveLinear, animations: {
                    self.mainView.layoutIfNeeded()
                }, completion: nil)
            }
          
            return subCategories.count
        }else{
            if configs.count == 0 {
                let view = ReviewBGView()
                view.image.image = #imageLiteral(resourceName: "No product")
                view.lable.text = "NO Product yet"
                view.backgroundColor = .clear
                collectionView.backgroundView = view
                
            }else{
                collectionView.backgroundView  = nil
            }
            return configs.count
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if collectionView == mainView.configCollection{
            mainView.heightCollectionConfig?.constant = collectionView.contentSize.height + 20
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if collectionView == mainView.configCollection{
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID2, for: indexPath) as? WishCell else {return UICollectionViewCell()}
            cell.config = configs[indexPath.row]
            cell.handelFavBtnTapped =  { [weak self] (id) in
                guard let self = self else{return}
                if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != "" {
                    APIClient.toggleFav(id: id) { (result) in
                        switch result {
                        case.success(let data):
                            self.createAlert(title: nil, erroMessage: data.message ?? "", createButton: nil)
                            print(data)
                        case .failure(_):
                            break
                        }
                    }
                }else{
                    self.presentLoginViewController(loginDismiss:true)
                }
            }
            cell.handelCartBtnTappedClouser = { [weak self] (configDeta) in
                guard let self = self else{return}
                if UserDefaults.standard.string(forKey: Constants.Defaults.authToken) != "" {
                    self.addViewAddToCart( slug: configDeta.slug ?? "" )
                }else{
                    self.presentLoginViewController(loginDismiss: true)
                }
                
            }
            return cell
        }else if collectionView == mainView.categoriesCollection {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? CatogrieCell else{return UICollectionViewCell()}
            cell.category = subCategories[indexPath.row]
            return cell
        }else{
          return UICollectionViewCell()
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if collectionView == mainView.configCollection {
//            let  padding:CGFloat = 8 * 4
//            let width = collectionView.frame.width - padding
//            let itemWidth = width / 3
//            return CGSize(width: itemWidth, height: itemWidth + 4)
            return CGSize(width: collectionView.frame.width / 2 - 16 , height: 215 )
        }else{
            let  padding:CGFloat = 8 * 7
            let width = collectionView.frame.width - padding
            let itemWidth = width / 6
            return CGSize(width: itemWidth, height:  90)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
    }
    //    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    //        return 4
    //    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//         if collectionView == mainView.configCollection {
//            return 4 }
//         else {
            return 8
//        }
        
    }
    
//    fileprivate var sectionInsets: UIEdgeInsets {
//        return .zero
//    }
//    fileprivate var itemsPerRow: CGFloat {
//        return 2
//    }
//    fileprivate var interitemSpace: CGFloat {
//        return 8.0
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        sizeForItemAt indexPath: IndexPath) -> CGSize {
//        if collectionView == mainView.configCollection {
//            let sectionPadding = sectionInsets.left * (itemsPerRow + 1)
//            let interitemPadding = max(0.0, itemsPerRow - 1) * interitemSpace
//            let availableWidth = collectionView.bounds.width - sectionPadding - interitemPadding
//            let widthPerItem = availableWidth / itemsPerRow
//            return CGSize(width: widthPerItem, height: widthPerItem)
//        }else{
//            return collectionView.bounds.size
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        insetForSectionAt section: Int) -> UIEdgeInsets {
//        if collectionView == mainView.configCollection {
//             return sectionInsets
//        }else{
//            return .zero
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView,
//                        layout collectionViewLayout: UICollectionViewLayout,
//                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
//        if collectionView == mainView.configCollection {
//            return 8.0
//        }else{
//            return .zero
//        }
//    }
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
//        if collectionView == mainView.configCollection {
//            return interitemSpace
//        }else{
//            return .zero
//        }
//    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        if collectionView == mainView.categoriesCollection {
            let cell = collectionView.cellForItem(at: indexPath) as? CatogrieCell
            getVCData(slug: cell?.category?.slug ?? "")
        }else{
            let VC = ItemDetailVC()
            VC.slug = configs[indexPath.row].slug
            self.present(VC, animated: true, completion: nil)
        }
    }
}
