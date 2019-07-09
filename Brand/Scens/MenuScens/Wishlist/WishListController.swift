//
//  WishListController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/17/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class WishListController: UIViewController,ButtonActionDelegate {
    lazy var mainView: WishListView = {
        let v = WishListView(delegate: self, dataSource: self,actionDelegate:self)
        v.backgroundColor = .white
        return v
    }()
    let reachability =  Reachability()
    let cellID = "cellID"
    var wishes: [Config] = []
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
        getWishlist()
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
    private func getWishlist(){
        APIClient.getWishList { (result) in
            switch result{
            case .success(let data):
                self.wishes = data.favorites
                self.mainView.wishCollection.reloadData()
            case .failure(let error):
                print(error)
            }
        }
    }
}
