//
//  ItemDetailsView_V2.swift
//  Brand
//
//  Created by iOS on 9/9/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

protocol DelegateCustomTabBarButton {
    func changeCustomTabBarBtnColor(name:String)
}

class ItemDetailsView_V2 : UIView {
    
    var paginateReviews : ( ()->Void )?
    var headerViewHeightConstraint: NSLayoutConstraint?
    var headerViewMaxHeight: CGFloat = 0.0
    let headerViewMinHeight: CGFloat = 58 + UIApplication.shared.statusBarFrame.height + 50
    
    var firstTab = FirstTabItemDetails()
    var secondTab = SecondTabItemDetials()
    var thirdTab = ThirdTabItemDetails()
    
    var delegateCustomTabBarButton : DelegateCustomTabBarButton?
    
    lazy var navView : ViewNavBarItemDetails = {
        let v = ViewNavBarItemDetails(actionDelegate: self  )
        
        return v
    }()
    
    lazy var scrollViewMain : UIScrollView = {
       
        let s = UIScrollView()
        s.isPagingEnabled = true
//        c.register(CellItemDetailsFirstTab.self , forCellWithReuseIdentifier: CellItemDetailsFirstTab.getIdentifier())
//        c.register(SecondeCell.self , forCellWithReuseIdentifier: SecondeCell.getIdentifier() )
//        c.register(ThirdCell.self , forCellWithReuseIdentifier: ThirdCell.getIdentifier())
        s.isScrollEnabled = true
        s.addSubview(self.parentInScrollView)
        self.parentInScrollView.translatesAutoresizingMaskIntoConstraints = false
        self.parentInScrollView.topAnchor.constraint(equalTo: s.topAnchor , constant: 0).isActive = true
        self.parentInScrollView.bottomAnchor.constraint(equalTo: s.bottomAnchor , constant: 0).isActive = true
        self.parentInScrollView.leadingAnchor.constraint(equalTo: s.leadingAnchor , constant: 0).isActive = true
        self.parentInScrollView.trailingAnchor.constraint(equalTo: s.trailingAnchor , constant: 0).isActive = true
        self.parentInScrollView.heightAnchor.constraint(equalTo: s.heightAnchor , multiplier: 1).isActive = true
        
        return s
    }()
    
    lazy var parentInScrollView : UIView = {
       let v = UIView()
        return v
    }()

    
    lazy var headerView : HeaderViewItemDetails = {
        let v = HeaderViewItemDetails( buttonActionDelegate! )
        return v
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    var buttonActionDelegate : ButtonActionDelegate?
    
    init(buttonActionDelegate : ButtonActionDelegate , scrollDelegate : UIScrollViewDelegate ) {
        super.init(frame: .zero )
        self.scrollViewMain.delegate = scrollDelegate
        self.buttonActionDelegate = buttonActionDelegate
        initViews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        initViews()
    }
    
    private func initViews () {
        self.backgroundColor = .white
        addViews()
        
        self.scrollViewMain.delegate = self
    }
    
    private func addViews () {
        self.addSubview(scrollViewMain)
        self.addSubview(headerView)
        self.addSubview(navView)
        
        navView.anchor(top: self.topAnchor , leading: self.leadingAnchor , trailing: self.trailingAnchor , height: headerViewMinHeight - 50 )
        
        headerView.anchor(top: self.topAnchor , leading: self.leadingAnchor  , trailing: self.trailingAnchor  )
        scrollViewMain.anchor(top: headerView.bottomAnchor , leading: self.leadingAnchor , bottom: self.safeAreaLayoutGuide.bottomAnchor , trailing: self.trailingAnchor )
        creatingPages()
        
    }
    
    private func creatingPages () {
        firstTab.scrollView.delegate = self
        secondTab.delegate = self
        thirdTab.scrollView.delegate = self
        
        parentInScrollView.addSubview(firstTab)
        parentInScrollView.addSubview(secondTab)
        parentInScrollView.addSubview(thirdTab)
        
        firstTab.anchor(top: parentInScrollView.topAnchor, leading: parentInScrollView.leadingAnchor , bottom: parentInScrollView.bottomAnchor)
        firstTab.heightAnchor.constraint(equalTo: scrollViewMain.heightAnchor, multiplier: 1).isActive = true
        firstTab.widthAnchor.constraint(equalTo: scrollViewMain.widthAnchor , multiplier: 1 ).isActive = true
        
        secondTab.anchor(top: parentInScrollView.topAnchor, leading: firstTab.trailingAnchor , bottom: parentInScrollView.bottomAnchor)
        secondTab.heightAnchor.constraint(equalTo: scrollViewMain.heightAnchor, multiplier: 1).isActive = true
        secondTab.widthAnchor.constraint(equalTo: scrollViewMain.widthAnchor , multiplier: 1 ).isActive = true
        
        thirdTab.anchor(top: parentInScrollView.topAnchor, leading: secondTab.trailingAnchor , bottom: parentInScrollView.bottomAnchor , trailing: parentInScrollView.trailingAnchor )
        thirdTab.heightAnchor.constraint(equalTo: scrollViewMain.heightAnchor, multiplier: 1).isActive = true
        thirdTab.widthAnchor.constraint(equalTo: scrollViewMain.widthAnchor , multiplier: 1 ).isActive = true
        
        
    }
    
    
    
}


extension ItemDetailsView_V2 : ButtonActionDelegate {
    func dissmisController() {
        buttonActionDelegate?.dissmisController?()
    }
}

extension ItemDetailsView_V2 : UIScrollViewDelegate , UITableViewDelegate {
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if self.scrollViewMain == scrollView {
            let pageIndex = round(scrollView.contentOffset.x/scrollView.frame.width)
         //   print("page : \(pageIndex)")
            if pageIndex == 0 {
                delegateCustomTabBarButton?.changeCustomTabBarBtnColor(name: "details")
            }else if pageIndex == 1 {
                delegateCustomTabBarButton?.changeCustomTabBarBtnColor(name: "specs")
            }else if pageIndex == 2 {
                delegateCustomTabBarButton?.changeCustomTabBarBtnColor(name: "review" )
            }
            return
        }
        
        let y: CGFloat = scrollView.contentOffset.y
        setContentOfSetZero(scrollView)
        // print("y scroll : \(y)")
        
        guard let headerViewHeightConstraint = headerViewHeightConstraint else {return}
        
        let newHeaderViewHeight: CGFloat = headerViewHeightConstraint.constant - y
        
        // print("newHeader scroll : \(newHeaderViewHeight)")
        setContentOfSetZero(scrollView)
        
        
        if newHeaderViewHeight > headerViewMaxHeight {
            headerViewHeightConstraint.constant = headerViewMaxHeight
        } else if newHeaderViewHeight < headerViewMinHeight {
            headerViewHeightConstraint.constant = headerViewMinHeight
            navView.fillColor()
            UIView.animate(withDuration: 0.3) {
                self.headerView.favBtn.isHidden = true
                self.headerView.cartBtn.isHidden = true
            }
            
        } else {
            navView.transparentView()
            UIView.animate(withDuration: 0.3) {
                self.headerView.favBtn.isHidden = false
                self.headerView.cartBtn.isHidden = false
            }
            headerViewHeightConstraint.constant = newHeaderViewHeight
            scrollView.contentOffset.y = 0 // block scroll view
            
        }
        
    }
    
    private func setContentOfSetZero (_ scrollView : UIScrollView ) {
        if scrollView == firstTab.scrollView {
            secondTab.contentOffset.y = 0
            thirdTab.scrollView.contentOffset.y = 0
        }else if scrollView == secondTab {
            firstTab.scrollView.contentOffset.y = 0
            thirdTab.scrollView.contentOffset.y = 0
        }else if scrollView == thirdTab.scrollView {
            secondTab.contentOffset.y = 0
            firstTab.scrollView.contentOffset.y = 0
           
            let height = scrollView.frame.size.height
            let contentYoffset = scrollView.contentOffset.y
            let distanceFromBottom = scrollView.contentSize.height - contentYoffset
            if distanceFromBottom <  ( height + 100 )  {
                paginateReviews?()
            }
        }
    }
    
    
}



