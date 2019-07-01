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
        getReviews()
    }
    private func getReviews(){
        APIClient.getReviews { (result) in
            switch result {
            case.success(let data):
                self.reviews = data.ratingables
                self.mainView.reviewCollection.reloadData()
            case.failure(let error):
                print(error)
                
            }
        }
    }
}
