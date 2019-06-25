//
//  CheckoutController.swift
//  Brands
//
//  Created by Nada Dyaa on 3/10/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
class CheckoutController: UIViewController ,ButtonActionDelegate ,UITableViewDataSource,UITableViewDelegate{
    enum CardState {
        case expanded
        case collapsed
    }
    
    lazy var mainView: CheckOutView = {
        let v = CheckOutView()
        return v
    }()
    var cardHeight = 400
     var cardHandleAreaHeight = 0
      var defaultaddress : Address?
     var addresses = [Address]()
     let reachability =  Reachability()
    var cardVisible = false
    var nextState:CardState {
        return cardVisible ? .collapsed : .expanded
    }
    var runningAnimations = [UIViewPropertyAnimator]()
    var animationProgressWhenInterrupted:CGFloat = 0
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    override func loadView() {
        super.loadView()
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()

       
        mainView.actionDelegete = self
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        mainView.viewnoaddress.isHidden = true
        mainView.viewwithAddress.isHidden = true

        
        let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(CheckoutController.handleCardTap(recognzier:)))
        mainView.BGView.addGestureRecognizer(tapGestureRecognizer)
        let tapGestureRecognizer2 = UITapGestureRecognizer(target: self, action: #selector(CheckoutController.handleCardTap2(recognzier:)))
        mainView.addGestureRecognizer(tapGestureRecognizer2)
    }
    @objc
    func handleCardTap(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
//            self.mainView.BGView.isHidden = true
//            self.mainView.addnewadd.isHidden = true
//            self.mainView.addressName.text = self.defaultaddress!.addressName
//
//            if self.defaultaddress!.detailedAddress != nil {
//                self.mainView.addressDescription.text = self.defaultaddress!.country.name + "-" + self.defaultaddress!.state.name+"-"+self.defaultaddress!.city+"-"+self.defaultaddress!.detailedAddress!
//                        }else{
//                self.mainView.addressDescription.text = self.defaultaddress!.country.name + "-" + self.defaultaddress!.state.name+"-"+self.defaultaddress!.city
//
//     }
    }
    @objc
    func handleCardTap2(recognzier:UITapGestureRecognizer) {
        switch recognzier.state {
        case .ended:
            animateTransitionIfNeeded(state: nextState, duration: 0.9)
        default:
            break
        }
//        self.mainView.BGView.isHidden = true
//        self.mainView.addnewadd.isHidden = true
      //  self.mainView.addressName.text = self.defaultaddress!.addressName
        
//        if self.defaultaddress!.detailedAddress != nil {
//            self.mainView.addressDescription.text = self.defaultaddress!.country.name + "-" + self.defaultaddress!.state.name+"-"+self.defaultaddress!.city+"-"+self.defaultaddress!.detailedAddress!
//        }else{
//            self.mainView.addressDescription.text = self.defaultaddress!.country.name + "-" + self.defaultaddress!.state.name+"-"+self.defaultaddress!.city
//
//        }
        
        
        
    }
    override func viewWillDisappear(_ animated: Bool) {
        stopNotifier(reachability: reachability)
    }
    var ss = true
    func defaultmethod1() {
        if  mainView.defaultviewcash.isHidden == true {
            mainView.defaultviewcash.isHidden = false
            mainView.defaultviewcredit.isHidden = true
        }
    }
    func defaultmethod2() {
        if  mainView.defaultviewcredit.isHidden == true {
            mainView.defaultviewcredit.isHidden = false
            mainView.defaultviewcash.isHidden = true
        }
    }
    func dissmisController() {
        self.dismiss(animated: true, completion: nil)
    }
    func saveButtonTapped() {
        
    }
    func changeBtn() {
animateTransitionIfNeeded(state: nextState, duration: 0.9)
//        self.mainView.BGView.isHidden = false
//        self.mainView.addnewadd.isHidden = false
//        self.mainView.tableView.heightAnchor.constraint(equalToConstant: self.mainView.frame.height/2-75).isActive = true
//        animateTransitionIfNeeded(state: nextState, duration: 0.9)

    }
    func addBtn() {
        let address = AddressInfoViewController()
        self.present(address, animated: true, completion: nil)
    }
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)

        mainView.ExchangeView.isHidden = true
        mainView.BGView.isHidden = true

         self.mainView.ExchangeView.frame.origin.y = self.mainView.frame.height - CGFloat(self.cardHandleAreaHeight)+25

        handelReachability(reachability: reachability)
        addresses.removeAll()

        mainView.activityStartAnimating(activityColor: #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1), backgroundColor: .clear)
        DispatchQueue.main.async {
            APIClient.UserAddress
                { (result) in
                    switch result {
                    case .success(let data) :
                        if data.data.count != 0{
                            self.mainView.viewnoaddress.isHidden = true
                            self.mainView.viewwithAddress.isHidden = false

                            for address in data.data {
                                self.addresses.append(Address(id: address.id, country: address.country, state: address.state, city: address.city, addressName: address.addressName, detailedAddress: address.detailedAddress, personName: address.personName, phone: address.phone, postalCode:  address.postalCode, lat: address.lat, lng: address.lng, main: address.main))
                                if address.main == true {
                                    self.defaultaddress = address
                                    self.mainView.addressName.text = address.addressName

                                    if address.detailedAddress != nil {
                                        self.mainView.addressDescription.text = "\(address.country.name ?? "hhh")-  \(address.state.name ?? "")-\(address.city)-\(address.detailedAddress!)"
                                    }else{
                                        self.mainView.addressDescription.text = "\(address.country.name ?? "hhhh")- \(address.state.name ?? "")-\(address.city)"

                                    }
                                }
                            }
                            DispatchQueue.main.async {
                               self.mainView.tableView.reloadData()
                                self.mainView.activityStopAnimating()
                            }
                        }else{
                            self.mainView.viewnoaddress.isHidden = false
                            self.mainView.viewwithAddress.isHidden = true
                            self.mainView.activityStopAnimating()
                        }
                    case .failure(let error) :
                        print(error)
                        self.mainView.activityStopAnimating()
                    }
            }
        }
    }
    func animateTransitionIfNeeded (state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            let frameAnimator = UIViewPropertyAnimator(duration: duration, dampingRatio: 1) {
                switch state {
                case .expanded:
                    self.mainView.ExchangeView.isHidden = false
                    self.mainView.tableView.heightAnchor.constraint(equalToConstant: self.mainView.frame.height/2-75).isActive = true
                    self.mainView.ExchangeView.frame.origin.y = self.mainView.frame.height - CGFloat(self.cardHeight)
                    self.mainView.ExchangeView.backgroundColor = .white
                    self.mainView.BGView.isHidden = false

                case .collapsed:
                    self.mainView.ExchangeView.frame.origin.y = self.mainView.frame.height - CGFloat(self.cardHandleAreaHeight)+25
                    self.mainView.BGView.isHidden = true
                    self.mainView.ExchangeView.backgroundColor = .white
                }
            }
            
            frameAnimator.addCompletion { _ in
                self.cardVisible = !self.cardVisible
                self.runningAnimations.removeAll()
            }
            
            frameAnimator.startAnimation()
            runningAnimations.append(frameAnimator)
            
            
            let cornerRadiusAnimator = UIViewPropertyAnimator(duration: duration, curve: .linear) {
                switch state {
                case .expanded:
                    self.mainView.ExchangeView.layer.cornerRadius = 12
                case .collapsed:
                    self.mainView.ExchangeView.layer.cornerRadius = 0
                }
            }
            
            cornerRadiusAnimator.startAnimation()
            runningAnimations.append(cornerRadiusAnimator)
       }
    }
    func startInteractiveTransition(state:CardState, duration:TimeInterval) {
        if runningAnimations.isEmpty {
            animateTransitionIfNeeded(state: state, duration: duration)
        }
        for animator in runningAnimations {
            animator.pauseAnimation()
            animationProgressWhenInterrupted = animator.fractionComplete
        }
    }
    
    func updateInteractiveTransition(fractionCompleted:CGFloat) {
        for animator in runningAnimations {
            animator.fractionComplete = fractionCompleted + animationProgressWhenInterrupted
        }
    }
    
    func continueInteractiveTransition (){
        for animator in runningAnimations {
            animator.continueAnimation(withTimingParameters: nil, durationFactor: 0)
        }
      }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return addresses.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellId", for: indexPath) as! MyAddressCell
        let address = addresses[indexPath.row]
        cell.address = address
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       defaultaddress = addresses[indexPath.row]
        for i in 0...addresses.count-1 {
            let  cell  = self.mainView.tableView.cellForRow(at: [0,i]) as! MyAddressCell
            if i == indexPath.row {
                cell.defaultview.isHidden = false
            }else{
                
                cell.defaultview.isHidden = true
            }
            
        }
        animateTransitionIfNeeded(state: nextState, duration: 0.9)

    }
    
}

