//
//  LoginBtnDelegate.swift
//  Brands
//
//  Created by Eslam Dweeb on 1/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit

@objc protocol ButtonActionDelegate{
     @objc optional func normalLogin()
     @objc optional func signup()
     @objc optional func faceBookLogin()
     @objc optional func twitterLogin()
     @objc optional func googleLogin()
     @objc optional func togglePassword(_ sender :UIButton)
     @objc optional func dissmisController()
     @objc optional func continuePressed()
     @objc optional func forgotPassword()
     @objc optional func loginBtnTapped()
     @objc optional func signupBtnTapped()
     @objc optional func imageViewTapped()
     @objc optional func editeButtonTapped(_ sender: UIButton)
     @objc optional func saveButtonTapped()
     @objc optional func pickButtonTapped()
     @objc optional func wishBtnTapped()
     @objc optional func applyBtnTapped()
     @objc optional func filterBtnTapped()
     @objc optional func defaultmethod1()
     @objc optional func defaultmethod2()
    @objc optional func changeBtn()
     @objc optional func addBtn()
     @objc optional func handelSeeAllBtn()
}
@objc protocol DisplayViewControllerDelegate {
    
    @objc  func doSomethingWith(lat : Double , len : Double)
}
