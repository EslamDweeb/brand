//
//  FlashSaleController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/20/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class FlashSaleController: UIViewController,ButtonActionDelegate {
    var date:String?
    lazy var mainView: FlashSaleView = {
        let v = FlashSaleView(delegate: self, dataSource: self,buttonActionDelegate:self)
        v.backgroundColor = #colorLiteral(red: 0.9803921569, green: 0.9843137255, blue: 0.9843137255, alpha: 1)
        return v
    }()
    let cellID = "cellId"
    
    var flashes:[Flash] = []
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        date = self.convertDateFormatter(date: "2019-07-03 18:30:00")
        print(date)
        getFlashData()
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func getFlashData(){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getFlashData { (result) in
                switch result {
                case.success(let data):
                    self.flashes = data.flashes
                    print(data)
                    self.mainView.activityStopAnimating()
                    self.mainView.flashCollection.reloadData()
                case.failure(let error):
                    print(error)
                    self.mainView.activityStopAnimating()
                }
            }
        }
    }
}
