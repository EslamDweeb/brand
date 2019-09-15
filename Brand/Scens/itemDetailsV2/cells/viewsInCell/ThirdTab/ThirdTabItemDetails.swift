//
//  ThirdTabItemDetails.swift
//  Brand
//
//  Created by iOS on 9/15/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ThirdTabItemDetails : UIView {
    
    private var heightCollectionReviews : NSLayoutConstraint?
    lazy var reviews = [Ratingable]()
    lazy var header = ThirdCellHeadView(buttonActionDelegate: self)
    var handelAddReviewButtonTapped:(() -> ())?
    
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
    
    lazy var reviewTableView : UITableView  = {
    
        let t = UITableView()
        t.register(CellThirdTabItemDetails.self , forCellReuseIdentifier: CellThirdTabItemDetails.getIdentifier() )
        t.allowsSelection = false
        t.separatorStyle = .none
        t.backgroundColor = .white
        t.isScrollEnabled = false
        t.delegate = self
        t.dataSource = self
        return t
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame )
        initTableView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initTableView()
    }

    private func initTableView () {
        addSubview(scrollView)
        parentInScrollView.addSubview(header)
        parentInScrollView.addSubview(reviewTableView)
        
        scrollView.anchor(top: self.topAnchor , leading: self.leadingAnchor , bottom: self.bottomAnchor , trailing: self.trailingAnchor )
        
        header.anchor(top: parentInScrollView.topAnchor, left: parentInScrollView.leftAnchor, bottom: nil, right: parentInScrollView.rightAnchor , centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 200, paddingCenterX: 0, paddingCenterY: 0)
        reviewTableView.anchor(top: header.bottomAnchor, left: parentInScrollView.leftAnchor, bottom: parentInScrollView.bottomAnchor , right: parentInScrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 8, paddingLeft: 8, paddingBottom: 8 , paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        heightCollectionReviews = reviewTableView.heightAnchor.constraint(equalToConstant: 5 )
        heightCollectionReviews?.isActive = true
        

    }
    
    
}


extension ThirdTabItemDetails : ButtonActionDelegate {
   
    func addBtn() {
        self.handelAddReviewButtonTapped?()
    }
   
}

extension ThirdTabItemDetails : UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        heightCollectionReviews?.constant = tableView.contentSize.height + 10
    }
 
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.reviews.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: CellThirdTabItemDetails.getIdentifier() , for: indexPath ) as! CellThirdTabItemDetails
        cell.review = reviews[indexPath.row]
        return cell
    }

}

