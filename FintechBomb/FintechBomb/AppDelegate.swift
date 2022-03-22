//
//  AppDelegate.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/11.
//

import UIKit
import Flutter

@main
class AppDelegate: UIResponder, UIApplicationDelegate, FlutterAppLifeCycleProvider {
    func add(_ delegate: FlutterApplicationLifeCycleDelegate) {
      print("实现了 FlutterAppLifeCycleProvider 代理.")
    }
    
    lazy var flutterEngine = FlutterEngine(name: "fintech flutter engine..")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        flutterEngine.run()
        
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

extension UIWindow {
    open override func motionEnded(_ motion: UIEvent.EventSubtype, with event: UIEvent?) {
        let toggleDataStore: ToggleDataStoreType = BuildTargetToggleDataStore.shared
        if toggleDataStore.isToggleOn(BuildTargetToggle.debug) ||
            toggleDataStore.isToggleOn(BuildTargetToggle.uat) {
            if motion == .motionShake { // 摇晃手机
                let testVC = DDTestViewController()
                UIApplication.shared.keyWindow?.rootViewController?.navigationController?.pushViewController(testVC, animated: true);
//                navigationController?.pushViewController(testVC, animated: true)
                print("进入debug页面..")
            }
        }
    }
}
