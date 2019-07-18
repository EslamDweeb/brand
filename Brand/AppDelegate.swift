//
//  AppDelegate.swift
//  Brand
//
//  Created by Eslam Dweeb on 6/24/19.
//  Copyright © 2019 Eslam Dweeb. All rights reserved.
//

import UIKit
import TwitterKit
import FBSDKCoreKit
import GoogleMaps
import MOLH

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate,MOLHResetable {
    func reset() {
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = SplashViewController()
    }
    

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        MOLHLanguage.setDefaultLanguage("en")
        MOLH.shared.activate(true)
        MOLH.shared.specialKeyWords = ["Cancel","Done"]
        window = UIWindow()
        window?.makeKeyAndVisible()
        window?.rootViewController = ItemDetailVC()
        TWTRTwitter.sharedInstance().start(withConsumerKey: "KUkghIKbyb7SsRULpDfjCmK30", consumerSecret: "mgpVgM29xQLZhg37Z7cKkhQ6FLaYhWOdJdp5MKVQEtfUpN9HgK")
        ApplicationDelegate.shared.application(application, didFinishLaunchingWithOptions: launchOptions)

        GMSServices.provideAPIKey(Constants.Defaults.googleApiKey)

        return true
    }

    func applicationWillResignActive(_ application: UIApplication) {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
    }

    func applicationDidEnterBackground(_ application: UIApplication) {
        // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
        // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
    }

    func applicationWillEnterForeground(_ application: UIApplication) {
        // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
    }

    func applicationDidBecomeActive(_ application: UIApplication) {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillTerminate(_ application: UIApplication) {
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }


}

