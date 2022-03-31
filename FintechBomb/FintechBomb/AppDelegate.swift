//
//  AppDelegate.swift
//  FintechBomb
//
//  Created by 刁爷 on 2022/3/11.
//

import UIKit
import Flutter
import AvoidCrash

@main
class AppDelegate: UIResponder, UIApplicationDelegate, FlutterAppLifeCycleProvider {
    func add(_ delegate: FlutterApplicationLifeCycleDelegate) {
      print("实现了 FlutterAppLifeCycleProvider 代理.")
    }
    
    lazy var flutterEngine = FlutterEngine(name: "fintech flutter engine..")
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        /// 使用AvoidCrash模块
        avoidCrashStart()

        /// flutter model
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
//        let toggleDataStore: ToggleDataStoreType = BuildTargetToggleDataStore.shared
//        if toggleDataStore.isToggleOn(BuildTargetToggle.debug) ||
//            toggleDataStore.isToggleOn(BuildTargetToggle.uat) {
//            if motion == .motionShake { // 摇晃手机
//                let testVC = DDTestViewController()
//                UIApplication.shared.keyWindow?.rootViewController?.navigationController?.pushViewController(testVC, animated: true);
////                navigationController?.pushViewController(testVC, animated: true)
//                print("进入debug页面..")
//            }
//        }
    }
}

extension AppDelegate {
    /// 使用AvoidCrash对未实现的方法做拦截,并输出日志,可以拿到日志后自定义上传的友盟或者bugly平台或自己的后台系统
    func avoidCrashStart() {
        AvoidCrash.makeAllEffective()
        //================================================
        //   1、unrecognized selector sent to instance（方式1）
        //================================================
        
        //若出现unrecognized selector sent to instance并且控制台输出:
        //比如，对于部分字符串，继承关系如下
        //__NSCFConstantString --> __NSCFString --> NSMutableString --> NSString
        //你可以将上面四个类随意一个添加到下面的数组中，建议直接填入 NSString

        //我所开发的项目中所防止unrecognized selector sent to instance的类有下面几个，主要是防止后台数据格式错乱导致的崩溃。个人觉得若要防止后台接口数据错乱，用下面的几个类即可。
        let noneSelClassArray: [String] = ["String",
                                           "Array",
                                           "Dictionary",
                                           "NSNumber",
                                           "NSNull"]
        AvoidCrash .setupNoneSelClassStringsArr(noneSelClassArray)


        //================================================
        //   2、unrecognized selector sent to instance（方式2）
        //================================================
        
        //若需要防止某个前缀的类的unrecognized selector sent to instance
        //比如你所开发项目中使用的类的前缀:CC、DD
        //你可以调用如下方法
        
        let noneSelClassPrefix = ["ZMN",
                                  "FTK"]
        AvoidCrash.setupNoneSelClassStringPrefixsArr(noneSelClassPrefix)

        //监听通知:AvoidCrashNotification, 获取AvoidCrash捕获的崩溃日志的详细信息
        NotificationCenter.default.addObserver(self, selector: #selector(dealwithCrashMessage), name: NSNotification.Name(AvoidCrashNotification), object: nil)
    }
    
    @objc func dealwithCrashMessage(note: NSNotification) {
        //注意:所有的信息都在userInfo中
        //你可以在这里收集相应的崩溃信息进行相应的处理(比如传到自己服务器)
        print("bug: %@", note.userInfo ?? "nothing!!!")
    }
}
