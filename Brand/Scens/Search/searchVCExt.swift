////
////  searchVCExt.swift
////  Brand
////
////  Created by nada dyaa on 8/1/19.
////  Copyright © 2019 Eslam Dweeb. All rights reserved.
////
//
import Foundation
import UIKit
extension searchVC : UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if searchitems.count == 0 {
            let view = ReviewBGView()
            view.image.image = #imageLiteral(resourceName: "No product")
            view.lable.text = "NO Result"
            view.backgroundColor = .clear
            collectionView.backgroundView = view
            
        }else{
             collectionView.backgroundView  = nil
        }
        return searchitems.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellID" , for: indexPath) as? WishCell else{return UICollectionViewCell () }
        cell.config = searchitems[indexPath.row]
        return cell
    }
  
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width / 2 - 8 , height: 215 )
    }
   
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 4
       
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
       return 4
    }
    
}

