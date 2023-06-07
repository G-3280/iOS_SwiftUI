//
//  G_3280App.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/04/30.
//

import SwiftUI
import FirebaseCore

//class AppDelegate: NSObject, UIApplicationDelegate {
//  func application(_ application: UIApplication,
//       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
//    FirebaseApp.configure()
//
//    return true
//  }
//}

class AppDelegateAdaptor: NSObject, UIApplicationDelegate {
    var tabBarHidden = false
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        // 앱 시작 시 탭바를 보여줍니다.
//        showTabBar()
        
        return true
    }
    
    func hideTabBar() {
        guard let window = UIApplication.shared.windows.first else { return }
        guard let tabBarController = window.rootViewController as? UITabBarController else { return }
        
        tabBarController.tabBar.isHidden = true
        tabBarHidden = true
    }
    
    func showTabBar() {
        guard let window = UIApplication.shared.windows.first else { return }
        guard let tabBarController = window.rootViewController as? UITabBarController else { return }
        
        tabBarController.tabBar.isHidden = false
        tabBarHidden = false
    }
}

@main
struct G_3280App: App {
    
    @UIApplicationDelegateAdaptor(AppDelegateAdaptor.self) var appDelegate
    
    init() {
        FirebaseApp.configure()
    }
    
    @StateObject private var viewModel = AuthViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
        }
    }
}
