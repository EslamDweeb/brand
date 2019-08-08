//
//  AddReviewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 2/19/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class AddReviewController:UIViewController,ButtonActionDelegate {
    
    lazy var mainView: AddReviewView = {
        let v = AddReviewView(delegate: self)
        v.backgroundColor = UIColor.white
        return v
    }()
    var editeFlag:Bool?
    var catlogId:Int?
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
    func applyBtnTapped() {
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        }
        if editeFlag == true{
            updateReviewRquest(value:Int(mainView.headerView.rateView.rating),review:mainView.reviewView.textView.text,pros:mainView.prosView.textView.text,cons:mainView.consView.textView.text,objectId:mainView.review?.objectID ?? 0,ratingId:mainView.review?.id ?? 0)
        }else{
            addReviewRequest(id: catlogId!, value: Int(mainView.headerView.rateView.rating), review: mainView.reviewView.textView.text, pros: mainView.prosView.textView.text, cons: mainView.consView.textView.text)
        }
       
    }
    private func updateReviewRquest(value:Int,review:String,pros:String,cons:String,objectId:Int,ratingId:Int){
        APIClient.updateRview(value: value, review: review, pros: pros, cons: cons, objectId: objectId, ratingId: ratingId) { (result) in
            switch result{
            case.success(let data):
                if data.errors != nil {
                    self.createAlert(title: nil, erroMessage: data.errors ?? "")
                }else{
                    self.createAlert(title: nil, erroMessage: data.message ?? "")
                }
                self.mainView.activityStopAnimating()
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)){
                   if    data.errors == nil {
                    self.dismissPressentededControllers()
                    self.dissmisController()
                    }
                    
                }
            case.failure(let error):
                self.mainView.activityStopAnimating()
                self.createAlert(title: nil, erroMessage: error.localizedDescription  )
                print(error)
            }
        }
    }
    func addReviewRequest(id:Int,value:Int,review:String,pros:String,cons:String){
        APIClient.addRview(id: id, value: value, review: review, pros: pros, cons: cons) { (result) in
            switch result{
            case.success(let data):
                print(data)
                self.mainView.activityStopAnimating()
                if data.errors != nil {
                    self.createAlert(title: nil, erroMessage: data.errors ?? "")
                }else{
                    self.createAlert(title: nil, erroMessage: data.message ?? "")
                }
             //   self.createAlert(title: nil, erroMessage: data.message ?? "")
                DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + .seconds(3)){
                    if    data.errors == nil {
                        self.dismissPressentededControllers()
                        self.dissmisController()
                    }
                }
            case .failure(let error):
                print(error)
                  self.mainView.activityStopAnimating()
                self.createAlert(title: nil, erroMessage: error.localizedDescription  )

            }
        }
    }
}
