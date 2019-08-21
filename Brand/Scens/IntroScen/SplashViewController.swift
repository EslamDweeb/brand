//
//  SplashViewController.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/16/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
        let group = DispatchGroup()
        let reachability =  Reachability()
        var isLogin = UserDefaults.standard.bool(forKey: Constants.Defaults.isLogin)
        var isFirstRun = UserDefaults.standard.bool(forKey: Constants.Defaults.isFirstRun)
        var lastUpdate = UserDefaults.standard.data(forKey: Constants.Defaults.lastUpdate)
    
        lazy var mainView:SplashView = {
          let v = SplashView()
          return v
      }()
    override var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    override var prefersStatusBarHidden: Bool {
        return false
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getFCMToken()
        if  isFirstRun != true {
            handelThread { [weak self](success) in
                if success{
                    UserDefaults.standard.set(true, forKey: Constants.Defaults.isFirstRun)
                    self?.launchIntroPage()
                }
             }
        }else{
            handelThread { [weak self](success) in
                if success{
                   let storyBoard = UIStoryboard(name: "Main", bundle: nil)
                    let dest = storyBoard.instantiateViewController(withIdentifier: "mainTabVC")
                    self?.presentViewController(controller: dest, transitionModal: .crossDissolve, presentationStyle: nil)
                }
            }
        }
     }
    
        override func viewWillAppear(_ animated: Bool) {
            super.viewWillAppear(animated)
            handelReachability(reachability: reachability)
        }
        override func viewWillDisappear(_ animated: Bool) {
            stopNotifier(reachability: reachability)
        }
        private func launchIntroPage() {
            let layout = UICollectionViewFlowLayout()
            layout.scrollDirection = .horizontal
            let controller = IntroViewController(collectionViewLayout: layout)
            self.presentViewController(controller: controller, transitionModal: .crossDissolve, presentationStyle: nil)
        }
    //MARK:- API Services 
    private func handelThread(_ compleation: @escaping (_ success:Bool) -> Void){
        //secondCall
        group.enter()
        getCountries()
        //thirdCall
        group.enter()
        getBanners()
        group.enter()
        getFlashOfferHeader()
        //Thread finished
        group.notify(queue: .main){
            compleation(true)
        }
    }
    private func getCountries(){
        APIClient.AllCountries {[weak self] (result) in
            switch result {
            case .success(let data):
                self?.setEncodedData(data: data.data, Constants.Defaults.countries)
            self?.group.leave()
            case .failure(let error):
                print(error)
            }
        }
    }
    private func getBanners(){
        APIClient.getBanners {[weak self] (result) in
            switch result {
            case .success(let data):
                if self?.lastUpdate != nil {
                    self?.setEncodedData(data: data.banners, Constants.Defaults.banners)
                }else{
                    self?.setEncodedData(data: data.banners, Constants.Defaults.banners)
                    self?.group.leave()
                }
            case .failure(let error):
                print(error)
                self?.createAlert(erroMessage: "Error: Server Error please try again")
            }
        }
    }
    private func getFlashOfferHeader(){
        APIClient.getFlashOfferHeader{[weak self](result)in
            guard let self = self else{return}
            switch result{
            case.success(let data):
                if self.lastUpdate != nil {
                    self.setEncodedData(data: data.settings, Constants.Defaults.flashSale)
                }else{
                    self.setEncodedData(data: data.settings, Constants.Defaults.flashSale)
                    self.group.leave()
                }
            case .failure(let error):
                print(error)
                self.createAlert(erroMessage: "Error: Server Error please try again")
            }
        }
    }
}
