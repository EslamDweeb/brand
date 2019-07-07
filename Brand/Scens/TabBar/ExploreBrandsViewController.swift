//
//  ExploreBrandsViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class ExploreBrandViewController:UIViewController,ButtonActionDelegate {
    let cellID = "cellID"
    var brands = [Brand]()
    var categories = [Category]()
    let group = DispatchGroup()
    var toggel = false
    lazy var mainView: ExploreView = {
        let v = ExploreView(delegate: self, dataSource: self, actionDelegate: self)
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
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
         mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        group.enter()
            APIClient.getBrands { (result) in
                switch result {
                case .success(let brand) :
                    self.brands = brand.brands
                    self.group.leave()
                case .failure(let Err):
                    self.group.leave()
                    print(Err)
                }
            }
        
        group.enter()
        APIClient.getCategory { (result) in
            switch result{
            case .success(let cat):
                self.categories = cat.categories ?? []
                self.group.leave()
            case .failure(let err):
                print(err)
                self.group.leave()
            }
        }
        group.notify(queue: .main) {
            self.mainView.brandCollection.reloadData()
            self.mainView.categoriesCollection.reloadData()
            self.mainView.activityStopAnimating()
        }
    }
    
    fileprivate func toggelArrays(){
        if toggel {
            UIView.animate(withDuration: 0.5) {
                self.mainView.brandLable.text = "Explore All brand"
                self.mainView.categoriesLable.text = "Explore by Categories"
                self.mainView.brandCollection.reloadData()
                self.mainView.categoriesCollection.reloadData()
            }
        }else{
            UIView.animate(withDuration: 0.5) {
                self.mainView.brandLable.text = "Explore All categories"
                self.mainView.categoriesLable.text = "Explore by brands"
                self.mainView.brandCollection.reloadData()
                self.mainView.categoriesCollection.reloadData()
            }
        }
        toggel = !toggel
    }
    func handelSeeAllBtn() {
        toggelArrays()
    }
}
