//
//  HomeViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 3/12/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import SafariServices

class HomeViewController:UIViewController{
    let cellID = "CellID"
    var currentIndex = 0
    var timer : Timer?
    var newBanners = [Banner]()
    var arrangedBanners:[Banner]?

    lazy var mainView: HomeView = {
        let v = HomeView(delegate: self, dataSource: self)
        return v
    }()
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    func startTimer(){
        timer = Timer.scheduledTimer(timeInterval: 3.0, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)
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
      
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        guard let data = UserDefaults.standard.data(forKey: Constants.Defaults.banners) else {return}
            do {
               newBanners = try JSONDecoder().decode([Banner].self, from: data)
                self.arrangedBanners = self.newBanners.sorted(by: { $0.appPriority < $1.appPriority })
                self.mainView.bannerCollectionView.reloadData()
                if self.arrangedBanners!.count != 0 {
                 self.startTimer()
               }
                print(newBanners)
            
              } catch {
                  print(error)
           }
        }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidAppear(animated)
        timer?.invalidate()
        timer = nil
    }
}
