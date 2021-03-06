//
//  HomeViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import SafariServices

class ExploreVC:UIViewController,ButtonActionDelegate{
    let cellID = "CellID"
    var currentIndex = 0
    var popularCount = 0
    var recomendedCount = 0
    var latestCount = 0
    var timer : Timer?
    var newBanners = [Banner]()
    var arrangedBanners:[Banner]?
    var exploreData:ExploreData?
    var settings = [Settings]()
    let reachability =  Reachability()
    let titleArray  = ["recommendedProduct".localized,
                       "latestProduct".localized,
                       "popularProduct".localized
    ]
    lazy var mainView: HomeView = {
        let v = HomeView(delegate: self, dataSource: self,buttonDelegate: self)
        return v
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
    }
    func searchTapped() {
        self.present(searchVC(), animated: true, completion: nil)
    }
    @objc func timerAction(){
        let indexPath = mainView.bannerCollectionView.indexPath(for: mainView.bannerCollectionView.visibleCells[0])!
        if indexPath.row < arrangedBanners!.count - 1 {
            mainView.bannerCollectionView.scrollToItem(at: IndexPath(item: indexPath.row + 1, section: indexPath.section), at: .right, animated: true)
        }else{
            mainView.bannerCollectionView.scrollToItem(at: IndexPath(item:0, section: 0), at: .right, animated: true)
        }
    }
    
    override func loadView() {
        super.loadView()
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getExploreData()
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        handelReachability(reachability: reachability)
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        getDataFromLocalStorage()
    }
    private func getDataFromLocalStorage(){
        getBannersFromLocalDataStorage()
        getFlashOfferHeaderFromLocalDataStorage()
    }
    private func getBannersFromLocalDataStorage(){
        guard let data = UserDefaults.standard.data(forKey: Constants.Defaults.banners) else {return}
        do {
            newBanners = try JSONDecoder().decode([Banner].self, from: data)
            self.arrangedBanners = self.newBanners.sorted(by: { $0.appPriority < $1.appPriority })
            self.mainView.bannerCollectionView.reloadData()
            if self.arrangedBanners?.count != 0 {
                self.startTimer()
            }
            print(newBanners)
            
        } catch {
            print(error)
        }
    }
    private func getFlashOfferHeaderFromLocalDataStorage(){
        guard let data = UserDefaults.standard.data(forKey: Constants.Defaults.flashSale) else {return}
        do{
            settings = try JSONDecoder().decode([Settings].self, from: data)
            self.mainView.setting = self.settings[0]
        }catch(let error) {
            print(error)
        }
        
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        stopNotifier(reachability: reachability)
        timer?.invalidate()
        timer = nil
    }
    private func getExploreData(){
        DispatchQueue.main.async {
            self.mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0, green: 0, blue: 0, alpha: 0.6952322346), backgroundColor: .clear)
            APIClient.getExploreData { (result) in
                switch result {
                case.success(let data):
                    self.exploreData = data
                    self.recomendedCount = (data.recommended?.count ?? 0) - 1
                    self.popularCount = (data.popular?.count ?? 0) - 1
                    self.latestCount = (data.latest?.count ?? 0) - 1
                    print("\(self.recomendedCount)")
                    print("\(self.popularCount)")
                    print("\(self.latestCount)")
                  //  print(data.recommended)
                   // print(data.popular)
                  //  print(data.latest)
                    self.mainView.activityStopAnimating()
                    self.mainView.mainCollection.reloadData()
                case.failure(let error):
                    print(error)
                    self.mainView.activityStopAnimating()
                }
            }
        }
    }
    func imageViewTapped() {
        self.present(FlashSaleController(), animated: true, completion: nil)
    }
}
