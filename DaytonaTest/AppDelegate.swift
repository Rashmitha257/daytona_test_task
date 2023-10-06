//
//  AppDelegate.swift
//  DaytonaTest
//
//  Created by Softsuave on 05/10/2023.
//

import UIKit

var API_Key = ""

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        API_Key = (Bundle.main.object(forInfoDictionaryKey: apiKey) as? String) ?? ""
        return true
    }


}

