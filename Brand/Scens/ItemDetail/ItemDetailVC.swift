//
//  ItemDetailVC.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ItemDetailVC: UIViewController {
    let headerID = "headerID"
    let cellID = "cellID"
    var itemDetails:ItemDetailInfo?
    var slug:String?
    lazy var mainView:ItemDetailVCView = {
        let v = ItemDetailVCView(collectionDelegate: self, CollectionDataSource: self)
        v.backgroundColor = .white
        return v
    }()
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print("hi!!!!!!!!!!!!!!!!")
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        getItemDetailInfo()
    }
    private func getItemDetailInfo(){
        //hani-laptop-751586
        //noura-456735
        DispatchQueue.main.async {
            APIClient.getItemDetail(slug: self.slug ?? "hani-laptop-751586") { (result) in
                switch result{
                case .success(let data):
                    DispatchQueue.main.async {
                        self.itemDetails = data
                        self.mainView.mainCollectionView.reloadData()
                        print(data)
                    }
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
extension ItemDetailVC:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        guard let header = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerID, for: indexPath) as? ItemDetailCollHeader else{return UICollectionReusableView()}
        header.photos = itemDetails?.config.photos ?? []
        header.setData(rating: Double(itemDetails?.config.overallRating ?? 0), numberOfuserRating: Double(itemDetails?.config.overallRatingCount ?? 0), price: Double(itemDetails?.config.price ?? 0), sale: Double(itemDetails?.config.sale ?? 0), name: itemDetails?.config.name ?? "", numberOfPages: itemDetails?.config.photos.count ?? 0)
           header.header.imageCollectionView.reloadData()
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? MainCollCell else{return UICollectionViewCell()}
        cell.itemDetails = self.itemDetails
        cell.pageCollectionView.reloadData()
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        switch indexPath.row {
        case 0:
           return CGSize(width: collectionView.frame.width, height: 750)
        case 1:
            return CGSize(width: collectionView.frame.width, height:  collectionView.frame.height)
        case 2:
            return CGSize(width: collectionView.frame.width, height: 770)
        default:
             return CGSize(width: collectionView.frame.width, height: 800)
        }
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 350) //add your height here
    }
    
}
