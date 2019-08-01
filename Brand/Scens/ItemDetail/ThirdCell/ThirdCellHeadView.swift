//
//  ThirdCellHeadView.swift
//  Brand
//
//  Created by Eslam Dweeb on 7/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import Cosmos

class ThirdCellHeadView:UIView {
    var ratingData:OverallRating?{
        didSet{
            guard let rate = ratingData else{return}
            firstProgressView.progress.progressValue = CGFloat(rate.oneStarCount)
            secondProgressView.progress.progressValue = CGFloat(rate.twoStarCount)
            thirdProgressView.progress.progressValue = CGFloat(rate.threeStarCount)
            fourthProgressView.progress.progressValue = CGFloat(rate.fourStarCount)
            fifthProgressView.progress.progressValue = CGFloat(rate.fiveStarCount)
            firstProgressView.numberOfUserLable.text = "(\(rate.oneStarCount)user)"
            secondProgressView.numberOfUserLable.text = "(\(rate.twoStarCount)user)"
            thirdProgressView.numberOfUserLable.text = "(\(rate.threeStarCount)user)"
            fourthProgressView.numberOfUserLable.text = "(\(rate.fourStarCount)user)"
            fifthProgressView.numberOfUserLable.text = "(\(rate.fiveStarCount)user)"
            ratingValueLable.text = rate.avgValue
            ratingUserNumberLable.text = "(\(rate.totalCount)User)"
            rateView.rating = Double(rate.avgValue) ?? 0
        }
    }
    lazy var firstProgressView = RateProgressView()
    lazy var secondProgressView = RateProgressView()
    lazy var thirdProgressView = RateProgressView()
    lazy var fourthProgressView = RateProgressView()
    lazy var fifthProgressView = RateProgressView()
    
    lazy var vStackView:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 20
        stack.addArrangedSubview(firstProgressView)
        stack.addArrangedSubview(secondProgressView)
        stack.addArrangedSubview(thirdProgressView)
        stack.addArrangedSubview(fourthProgressView)
        stack.addArrangedSubview(fifthProgressView)
        stack.alignment = .center
        return stack
    }()
    lazy var ratingValueLable:UILabel = {
        let lbl = UILabel()
        lbl.font = setFont(name: .fontH, size: 28)
        lbl.text = "4.7"
        lbl.textColor = .pink
        return lbl
    }()
    lazy var ratingUserNumberLable:UILabel = {
        let lbl = UILabel()
        lbl.font = setFont(name: .fontM, size: 9)
        lbl.text = "(100 Reviews)"
        return lbl
    }()
    lazy var rateView:CosmosView = {
        let rate = CosmosView()
        rate.settings.totalStars = 5
        rate.settings.updateOnTouch = false
        rate.settings.starSize = 20
        rate.settings.filledImage = #imageLiteral(resourceName: "emptyStar")
        rate.settings.emptyImage = #imageLiteral(resourceName: "fill")
        rate.settings.starMargin = 2
        rate.settings.fillMode = .half
        return rate
    }()
    lazy var addReviewBtn:GradBtn = {
        let btn = GradBtn()
        btn.setTitle(NSLocalizedString("addReview", comment: ""), for: .normal)
        btn.titleLabel?.font = setFont(name: .fontM, size: 14)
        return btn
    }()
    lazy var vStackView2:UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.distribution = .fillEqually
        stack.spacing = 5
        stack.addArrangedSubview(ratingValueLable)
        stack.addArrangedSubview(ratingUserNumberLable)
        stack.addArrangedSubview(rateView)
        stack.addArrangedSubview(addReviewBtn)
        stack.alignment = .center
        return stack
    }()
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupView()
    }
    private func setLableText(){
        firstProgressView.numberLable.text = "1"
        secondProgressView.numberLable.text = "2"
        thirdProgressView.numberLable.text = "3"
        fourthProgressView.numberLable.text = "4"
        fifthProgressView.numberLable.text = "5"
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func setupView(){
        setLableText()
        addSubViews() 
        addConstriantsToViews()
    }
    private func addSubViews(){
        addSubview(vStackView)
        addSubview(vStackView2)
    }
    private func addConstriantsToViews(){
        vStackView.anchor(top: topAnchor, left: leftAnchor, bottom: nil, right: nil, centerX: nil, centerY: nil, paddingTop: 32, paddingLeft: 8, paddingBottom: 0, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        vStackView2.anchor(top: topAnchor, left: nil, bottom: nil, right: rightAnchor, centerX: nil, centerY: nil, paddingTop: 24, paddingLeft: 0, paddingBottom: 0, paddingRight: 8, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        firstProgressView.widthAnchor.constraint(lessThanOrEqualToConstant: 210).isActive = true
        firstProgressView.heightAnchor.constraint(lessThanOrEqualToConstant: 20).isActive = true
        addReviewBtn.widthAnchor.constraint(greaterThanOrEqualToConstant: 150).isActive = true
        addReviewBtn.heightAnchor.constraint(lessThanOrEqualToConstant: 30).isActive = true
    }
}
