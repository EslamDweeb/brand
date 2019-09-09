//
//  searchVC.swift
//  Brand
//
//  Created by nada dyaa on 8/1/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//


import UIKit
protocol isAbleToReceiveData {
    func pass(data: [DetailedConfig],brand : String ,price : String ,made : String ,Rate : String)  //data: string is an example parameter
}

class searchVC: UIViewController,ButtonActionDelegate , isAbleToReceiveData{
    
    typealias TagSearch = Tag
    
    
    func pass(data: [DetailedConfig],brand : String ,price : String ,made : String ,Rate : String) {
        print(data)
        searchitems = data
         self.mainView.searchCollection.reloadData()
    }
    lazy var mainView: searchView = {
        let v = searchView(delegate: self , dataSource: self, actionDelegate: self)
        v.backgroundColor = .white
        return v
    }()
   let reachability =  Reachability()
    var searchitems: [DetailedConfig] = []
    
    var tagSearch : TagSearch?
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        if tagSearch != nil && tagSearch?.name != nil && tagSearch?.id != nil {
            self.mainView.searchtextFeild.text = "#" + ( tagSearch?.name ?? "" )
            searchTextWithTag(tagSearchID: tagSearch?.id )
        }
        
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    
    var waitingTextSearch = false
    
    func changeBtn() {
        if self.mainView.searchtextFeild.text?.first == "#" {
            tagSearch = nil
            self.mainView.searchtextFeild.text = String(self.mainView.searchtextFeild.text?.dropFirst() ?? "")
        }
       searchTextWithTag()
    }
    
    private func searchTextWithTag (tagSearchID : Int? = nil) {
        if mainView.searchtextFeild.text!.count >= 1 , !waitingTextSearch {
            waitingTextSearch = true
            DispatchQueue.main.asyncAfter(deadline: .now() + 2 ) {
                self.waitingTextSearch = false
                // print("search text : \(self.mainView.searchtextFeild.text!)")
                if tagSearchID == nil {
                    self.getItems(text: self.mainView.searchtextFeild.text! )
                }else {
                    self.getItems( searchTag: tagSearchID )
                }
                
            }
            
        }else{
            searchitems = []
            self.mainView.FilterBtn.isHidden = true
            self.mainView.searchCollection.reloadData()
        }
    }
    
    
    
    func applyBtnTapped() {
         let CV = FilterViewController()
        CV.name = mainView.searchtextFeild.text!
        CV.delegate = self
        self.presentViewController(controller: CV, transitionModal: .crossDissolve, presentationStyle: .overCurrentContext)
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
        
    }
    func getItems(text : String? = nil  , searchTag : Int? = nil )  {
        searchitems.removeAll()
        DispatchQueue.main.async {
           // self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            self.mainView.showLoading()
            APIClient.getsearchitems(name: text , brand: "", origin: "", price: "", rate: "", show: "", page: 1, tag: searchTag , complition: { (result) in
                switch result {
                case .success(let data):
                    self.searchitems = data.configs!
                    DispatchQueue.main.async {
                        if self.searchitems.count != 0 {
                             self.mainView.FilterBtn.isHidden = false
                        }else{
                             self.mainView.FilterBtn.isHidden = true
                        }
                        self.mainView.searchCollection.reloadData()
                      //  self.mainView.activityStopAnimating()
                        self.mainView.hideLoading()
                    }
                case .failure(let error):
                   // self.mainView.activityStopAnimating()
                    self.mainView.hideLoading()
                    print(error)
                }
            })
           
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        stopNotifier(reachability: reachability)
    }
}

