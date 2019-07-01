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
    var reviews: [Review] = [
        Review(image: #imageLiteral(resourceName: "XSMax"), productName: "iPhone XS Max all colors 64 GB 4G LTE", brandName: "Apple", rate: 4.5, review: "Speaking comes to most people as naturally as breathing. On many occasions our words are uttered without conscious thought; in fact we rarely stop and think about what we are saying. Thousands of words,"),
        Review(image: #imageLiteral(resourceName: "XSMax"), productName: "Xiaomi Mi 8 Lite", brandName: "xiaomi", rate: 3.5, review: "Speaking comes to most people as naturally as breathing. On many occasions our words are uttered without conscious thought; in fact we rarely stop and think about what we are saying. Thousands of words,"),
        Review(image: #imageLiteral(resourceName: "XSMax"), productName: "Xiaomi Pocophone F1", brandName: "Apple", rate: 4, review: "Speaking comes to most people as naturally as breathing. On many occasions our words are uttered without conscious thought; in fact we rarely stop and think about what we are saying. Thousands of words,")
    ]
    
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
    
}
