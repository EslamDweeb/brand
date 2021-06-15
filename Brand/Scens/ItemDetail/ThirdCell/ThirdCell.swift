//
//  ThirdCell.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/22/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ThirdCell:UICollectionViewCell,ButtonActionDelegate{
    let cellID = "cellID"
    private var heightCollectionReviews : NSLayoutConstraint?
    var handelAddReviewButtonTapped:(() -> ())?
    var handelPaging:(()->())?
    
    lazy var scrollView : UIScrollView = {
       let s = UIScrollView()
        s.addSubview(self.parentInScrollView)
        self.parentInScrollView.anchor(top: s.topAnchor , leading: s.leadingAnchor , bottom: s.bottomAnchor , trailing: s.trailingAnchor )
        self.parentInScrollView.widthAnchor.constraint(equalTo: s.widthAnchor , multiplier: 1).isActive = true
        
        return s
    }()
    
    lazy var parentInScrollView : UIView = {
       let v = UIView()
        return v
    }()
    
    
    lazy var header = ThirdCellHeadView(buttonActionDelegate: self)
    lazy var reviews = [Ratingable]()
//    var shouldShowLoadingCell = false
//    var currentPage:Int = 1
//    var lastPage:Int?
    lazy var reviewCollectionView:UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.register(ThirdCellReviewCell.self, forCellWithReuseIdentifier: cellID)
        collection.backgroundColor = .clear
        collection.isScrollEnabled = false
        collection.delegate = self
        collection.dataSource = self
        return collection
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(scrollView)
        parentInScrollView.addSubview(header)
        parentInScrollView.addSubview(reviewCollectionView)
        
        scrollView.anchor(top: self.topAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor , trailing: self.trailingAnchor )
        
        header.anchor(top: parentInScrollView.topAnchor, left: parentInScrollView.leftAnchor, bottom: nil, right: parentInScrollView.rightAnchor , centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 200, paddingCenterX: 0, paddingCenterY: 0)
        reviewCollectionView.anchor(top: header.bottomAnchor, left: parentInScrollView.leftAnchor, bottom: parentInScrollView.bottomAnchor , right: parentInScrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        heightCollectionReviews = reviewCollectionView.heightAnchor.constraint(equalToConstant: 50 )
        heightCollectionReviews?.isActive = true
        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
extension ThirdCell:UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return reviews.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
         guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellID, for: indexPath) as? ThirdCellReviewCell else{ return UICollectionViewCell() }
        cell.review = reviews[indexPath.row]
        return cell
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
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        self.handelPaging?()
        heightCollectionReviews?.constant = collectionView.contentSize.height + 10 
    }
    func addBtn() {
        self.handelAddReviewButtonTapped?()
    }
    
}
