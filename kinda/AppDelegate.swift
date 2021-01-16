//
//  AppDelegate.swift
//  kinda
//
//  Created by Elle on 1/6/21.
//

import UIKit
import Firebase
@_exported import SnapKit
import FBSDKCoreKit
import Stripe

//buy NIO
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    // some code gotten from: https://ioscoachfrank.com/remove-main-storyboard.html
    public var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        StripeAPI.defaultPublishableKey = "pk_test_fc5eGEHZiBB2IlzUP6nwCvS6"
        // Override point for customization after application launch.
        window = UIWindow()
        window?.rootViewController = RootViewController()
        window?.makeKeyAndVisible()
        FirebaseApp.configure()
        return true
    }
    func application(
            _ app: UIApplication,
            open url: URL,
            options: [UIApplication.OpenURLOptionsKey : Any] = [:]
        ) -> Bool {

            ApplicationDelegate.shared.application(
                app,
                open: url,
                sourceApplication: options[UIApplication.OpenURLOptionsKey.sourceApplication] as? String,
                annotation: options[UIApplication.OpenURLOptionsKey.annotation]
            )

        }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

