//
//  AddReview.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos

class AddReviewView: UIView {
    var review:Review? {
        didSet{
            guard let review = review else{return}
            headerView.image.image = review.image
            headerView.brandName.text = review.brandName
            headerView.productName.text = review.productName
            headerView.rateView.rating = review.rate
            reviewView.textView.text = review.review
            prosView.textView.text = review.review
            consView.textView.text = review.review
        }
    }
    weak var delegate:ButtonActionDelegate?
    lazy var  navView:GradNavView = {
        let navView = GradNavView()
        return navView
    }()
    lazy var backBtn: UIButton = {
        let button = UIButton()
        button.setImage(#imageLiteral(resourceName: "arrowLeftAnticon"), for: .normal)
        button.addTarget(delegate, action: #selector(ButtonActionDelegate.dissmisController), for: .touchUpInside)
        return button
    }()
    lazy var titlelabel:UILabel = {
        let label = UILabel()
        label.text = "My Reviews"
        label.textColor = .white
        label.textAlignment = .center
        label.font = UIFont(name: "Avenir-Heavy", size: 14)
        return label
    }()
    lazy var headerView: ReviewHeaderView = {
        let view = ReviewHeaderView()
        return view
    }()
    lazy var reviewView: ReviewSectionView = {
        let view = ReviewSectionView()
        view.titleLable.text = "Review"
        return view
    }()
    lazy var prosView: ReviewSectionView = {
        let view = ReviewSectionView()
        view.titleLable.text = "Pros"
        return view
    }()
    lazy var consView: ReviewSectionView = {
        let view = ReviewSectionView()
        view.titleLable.text = "Cons"
        return view
    }()
    lazy var saveBtn: GradBtn = {
        let button = GradBtn()
        button.setTitle(NSLocalizedString("Save", comment: ""), for: .normal)
        button.setTitleColor( .white, for: .normal)
        button.titleLabel?.font = UIFont(name: "Avenir-Heavy", size: 20)
        return button
    }()
    lazy var scrollView: UIScrollView = {
        let scroll = UIScrollView()
        return scroll
    }()

    init(delegate:ButtonActionDelegate){
        super.init(frame: .zero)
        self.delegate = delegate
         setupView()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    private func setupView() {
        addSubViews()
        addConstrainsToUI()
    }
    private func addSubViews() {
        addSubview(navView)
        navView.addSubview(backBtn)
        navView.addSubview(titlelabel)
        addSubview(scrollView)
        scrollView.addSubview(headerView)
        scrollView.addSubview(reviewView)
        scrollView.addSubview(prosView)
        scrollView.addSubview(consView)
        scrollView.addSubview(saveBtn)
    }
    private func addConstrainsToUI() {
        navView.anchor(top: self.topAnchor, left: leftAnchor, bottom: nil, right: rightAnchor, centerX: centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        navView.heightAnchor.constraint(equalTo: self.heightAnchor, multiplier: 0.12).isActive = true
        titlelabel.anchor(top: nil, left: nil, bottom: navView.bottomAnchor, right: nil, centerX: navView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 120, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        backBtn.anchor(top: nil, left: navView.leftAnchor, bottom: nil, right: nil, centerX: nil, centerY:titlelabel.centerYAnchor, paddingTop: 0, paddingLeft: 20, paddingBottom: 20, paddingRight: 0, width: 20, height: 20, paddingCenterX: 0, paddingCenterY: 0)
        scrollView.anchor(top: navView.bottomAnchor, left: self.leftAnchor, bottom: self.bottomAnchor, right: self.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        headerView.anchor(top: scrollView.topAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 130, paddingCenterX: 0, paddingCenterY: 0)
        reviewView.anchor(top: headerView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 130, paddingCenterX: 0, paddingCenterY: 0)
        prosView.anchor(top: reviewView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 130, paddingCenterX: 0, paddingCenterY: 0)
        consView.anchor(top: prosView.bottomAnchor, left: scrollView.leftAnchor, bottom: nil, right: scrollView.rightAnchor, centerX: scrollView.centerXAnchor, centerY: nil, paddingTop: 8, paddingLeft: 0, paddingBottom: 0, paddingRight: 0, width: 0, height: 130, paddingCenterX: 0, paddingCenterY: 0)
        saveBtn.anchor(top: consView.bottomAnchor, left: scrollView.leftAnchor, bottom: scrollView.bottomAnchor, right: scrollView.rightAnchor, centerX: nil, centerY: nil, paddingTop: 20, paddingLeft: 8, paddingBottom: 0, paddingRight: 8, width: 0, height: 40, paddingCenterX: 0, paddingCenterY: 0)
    }
}
