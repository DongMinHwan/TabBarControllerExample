//
//  AppDelegate.swift
//  TabBarControllerExample
//
//  Created by DongMin Hwang on 2022/12/28.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        sleep(5)
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = QConstatn.PastelRedColor
//

//        // 시작화면 설정
        let startViewController = UIStoryboard(name: "LaunchScreen", bundle: nil).instantiateViewController(withIdentifier: "LaunchScreen")
        window?.rootViewController = startViewController//drawer
        window?.makeKeyAndVisible()
//
        return true
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

