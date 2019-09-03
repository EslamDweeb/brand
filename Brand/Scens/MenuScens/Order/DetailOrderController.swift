//
//  DetailOrderController.swift
//  Brands
//
//  Created by nada dyaa on 3/31/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class DetailorderVC : UIViewController ,ButtonActionDelegate{
    var mainView = DetailorderView()
    let reachability =  Reachability()
    var orderSerial:String?
    var refernceNumber : String?
    var pro: [Item] = []
    var status :[Int] = []
    var x = 0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        getOrderDetail()
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.actionDelegete = self
    }
    
    func saveButtonTapped() {
              DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
            APIClient.Canceleorder(refernceNumber: self.refernceNumber ?? "") { (result) in
                switch result{
                case.success(let data):
                    print(data)
                    self.mainView.activityStopAnimating()
                    
                case.failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            }
                self.dismiss(animated: true, completion: nil)
        }
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    private func getOrderDetail(){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.5))
            APIClient.getOrdersDetails(orderSerial: self.orderSerial ?? "") { (result) in
                switch result{
                case.success(let data):
                    print(data)
                    DispatchQueue.main.async {
                        self.refernceNumber = data.order.referenceNumber
                        self.mainView.order = data.order
                        self.pro = data.order.items ?? []
                        for i in data.order.statuses {
                            self.status.append(i.id)
                        }
                        if self.status.count != 1 {
                            self.mainView.confirmBtn.isEnabled = false
                           self.mainView.confirmBtn.backgroundColor = .lightgray
                              self.mainView.confirmBtn.setShadow(shadowColor: UIColor.pink.cgColor, shadowOffset: CGSize(width: 0, height: 0), shadowOpacity: 0, shadowRaduis: 4)
                        }else{
                            self.mainView.confirmBtn.isEnabled = true
                             self.mainView.confirmBtn.backgroundColor = .pink
                             self.mainView.confirmBtn.setShadow(shadowColor: UIColor.pink.cgColor, shadowOffset: CGSize(width: 0, height: 2), shadowOpacity: 1, shadowRaduis: 4)
                        }
                        print(self.status.max()!)
                        if self.status.max() ?? 1 <= 4 {
                            self.mainView.Statusbar.isHidden = false
                            self.mainView.statuslabel.isHidden = true
                            self.mainView.img.isHidden = true
                            self.mainView.Statusbar.currentIndex = self.status.max()!  - 1
                        }else{
                             self.mainView.Statusbar.isHidden = true
                             self.mainView.statuslabel.isHidden = false
                             self.mainView.img.isHidden = false
                        }
                        self.createItemDetailView()
                        self.CreateOrderDetailView()
                        self.mainView.activityStopAnimating()
                    }
                case.failure(let error):
                    self.mainView.activityStopAnimating()
                    print(error)
                }
            }
        }
    }
    private func createItemDetailView(){
        print(pro)
        if self.pro.count == 0 {
             self.mainView.orderitemsview.isHidden = true
        }else{
             self.mainView.orderitemsview.isHidden = false
        
        for i in self.pro {
            let addview : productCheckout = {
                let view = productCheckout()
                view.namelabel.text = i.name
                view.Qlabel.text  = "\(i.qty)"
                view.Pricelabel.text  = "\(i.unitOverallPrice)"
                return view
            }()
            self.mainView.orderitemsview.addSubview(addview)
            
            addview.anchor(top: self.mainView.orderitemsview.topAnchor, left: self.mainView.orderitemsview.leftAnchor, bottom: nil, right: self.mainView.orderitemsview.rightAnchor, centerX: nil, centerY: nil, paddingTop: CGFloat(72 + self.x), paddingLeft: 16, paddingBottom: 0, paddingRight:16, width: 0, height: 20, paddingCenterX: 0, paddingCenterY: 0)
            self.x += 25
            
        }
        self.mainView.orderitemsview.heightAnchor.constraint(equalToConstant: CGFloat(75 + self.x)).isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
        }
    }
    private func CreateOrderDetailView(){  
        self.mainView.detailsorderView.heightAnchor.constraint(equalToConstant: CGFloat(230)).isActive = true
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseOut, animations: {
            self.mainView.layoutIfNeeded()
        }, completion: nil)
    }
}
