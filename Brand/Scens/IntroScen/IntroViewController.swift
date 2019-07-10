//
//  IntroViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import MOLH

class IntroViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let reachability =  Reachability()
    
    let IntroPages = [
        IntroPage(imageName: "store", pageBody: "Join use today in our fun and games!"),
        IntroPage(imageName: "cart", pageBody: "Subscribe and get coupons on our daily events"),
        IntroPage(imageName: "categories", pageBody: "VIP members special services"),
        IntroPage(imageName: "megaStore", pageBody: "Join use today in our fun and games!")
    ]
    private let skipButton: UIButton = {
        let button = UIButton()
        button.setTitle("skip".localized, for: .normal)
        button.titleLabel?.font = UIFont(name: .fontH , size: 20)
        button.setTitleColor(.gray, for: .normal)
        button.addTarget(self, action: #selector(handleSkip), for: .touchUpInside)
        return button
    }()
    
    @objc private func handleSkip() {
        presentViewController(controller: SignUpViewController(), transitionModal: .crossDissolve, presentationStyle: nil)
    }
    lazy var nextButton: BtnImage = {
        let button = BtnImage()
        if MOLHLanguage.currentAppleLanguage() == "en"{
            button.setImage(#imageLiteral(resourceName: "nextButton"), for: .normal)
        }else{
            button.setImage(#imageLiteral(resourceName: "Group 2"), for: .normal)
        }
        button.addTarget(self, action: #selector(handleNext), for: .touchUpInside)
        return button
    }()
    @objc private func handleNext() {
        handelSwipe()
    }
    lazy var startedButton:GradBtn = {
        let button = GradBtn()
        button.setTitle("get_started".localized, for: .normal)
        button.isHidden = true
        button.addTarget(self, action: #selector(startBtn), for: .touchUpInside)
        return button
    }()
    
    @objc private func startBtn() {
        self.presentViewController(controller:  LoginViewController(), transitionModal:  .crossDissolve, presentationStyle: nil)
    }
    
    lazy var pageControl: UIPageControl = {
        let pc = UIPageControl()
        pc.currentPage = 0
        pc.numberOfPages = IntroPages.count
        pc.currentPageIndicatorTintColor = UIColor.pink
        pc.pageIndicatorTintColor = UIColor(red: 249/255, green: 207/255, blue: 224/255, alpha: 1)
        return pc
    }()
    fileprivate func setupBottomControls() {
        view.addSubview(nextButton)
        view.addSubview(skipButton)
        view.addSubview(startedButton)
        view.addSubview(pageControl)
        pageControl.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: nil, centerX: view.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 20, paddingRight: 0, width: 0, height: 0, paddingCenterX: 0, paddingCenterY: 0)
        if MOLHLanguage.currentAppleLanguage() == "en"{
            nextButton.anchor(top: nil, left: nil, bottom:  view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom: 10, paddingRight:10, width: 60, height: 60, paddingCenterX: 0, paddingCenterY: 0)
            skipButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 20, paddingBottom:20, paddingRight: 0, width: 80, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        }else{
            nextButton.anchor(top: nil, left: view.leftAnchor, bottom:  view.bottomAnchor, right: nil, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 10, paddingBottom: 10, paddingRight:0, width: 60, height: 60, paddingCenterX: 0, paddingCenterY: 0)
            skipButton.anchor(top: nil, left: nil, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: nil, centerY: nil, paddingTop: 0, paddingLeft: 0, paddingBottom:20, paddingRight: 20, width: 80, height: 30, paddingCenterX: 0, paddingCenterY: 0)
        }
        
        startedButton.anchor(top: nil, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor, centerX: view.centerXAnchor, centerY: nil, paddingTop: 0, paddingLeft: 20, paddingBottom: 40, paddingRight: 20, width: 0, height:50, paddingCenterX: 0, paddingCenterY: 0)
    }
    override func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
        
        let x = targetContentOffset.pointee.x
        pageControl.currentPage = Int(x/view.frame.width)
        if pageControl.currentPage < IntroPages.count - 1 {
            nextButton.isHidden = false
            skipButton.isHidden = true
            pageControl.isHidden = false
            startedButton.isHidden = true
        }
        else{
            startedButton.isHidden = false
            nextButton.isHidden = true
            skipButton.isHidden = true
            pageControl.isHidden = true
        }
    }
    func handelSwipe() {
        let nextIndex = min(pageControl.currentPage + 1, IntroPages.count )
        let indexPath = IndexPath(item: nextIndex, section: 0)
        pageControl.currentPage = nextIndex
        if nextIndex < IntroPages.count - 1 {
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            skipButton.isHidden = true
        }else if nextIndex == IntroPages.count - 1{
            collectionView?.scrollToItem(at: indexPath, at: .centeredHorizontally, animated: true)
            nextButton.isHidden = true
            pageControl.isHidden = true
            startedButton.isHidden = false
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(IntroPageCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.isPagingEnabled = true
        
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        setupBottomControls()
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
}

