//
//  ReviewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/18/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ReviewController: UIViewController,ButtonActionDelegate {
    lazy var mainView: ReviewView = {
        let v = ReviewView(delegate: self, dataSource: self,actionDelegate:self)
        v.backgroundColor = UIColor.backgroundColl
        return v
    }()
    var shouldShowLoadingCell = false
    var currentPage:Int = 1
    var lastPage:Int?
    let reachability =  Reachability()
    let cellID = "cellID"
    var reviews: [Ratingable] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        getReviews(true)
    }
    private func getReviews(_ refresh:Bool = false){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getReviews(page: self.currentPage) { (result) in
                switch result {
                case .success(let data):
                    if refresh {
                        self.reviews = data.ratingables
                    } else {
                        for conf in data.ratingables {
                            self.reviews.append(conf)
                        }
                    }
                    DispatchQueue.main.async {
                        self.mainView.activityStopAnimating()
                        self.shouldShowLoadingCell = ( data.meta.currentPage ?? 0) < (data.meta.lastPage ?? 0)
                        self.mainView.reviewCollection.reloadData()
                    }
                case .failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)                    
                }
            }
        }
    }
    //MARK:- Paging Functions
    func fetchNextPage() {
        currentPage += 1
        getReviews()
    }
}
