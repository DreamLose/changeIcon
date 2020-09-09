//
//  AppDelegate.swift
//  IconChange
//
//  Created by 2020 on 2020/9/3.
//  Copyright © 2020 2020. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        UITabBar.appearance().tintColor = UIColor(hexString: "#9B82CE")
        return true
        
       
    }

//    func application(_ app: UIApplication, open url: URL, options: [UIApplication.OpenURLOptionsKey : Any] = [:]) -> Bool {
//        UIApplication.shared.openURL(url)
//                return true
//        }


}

