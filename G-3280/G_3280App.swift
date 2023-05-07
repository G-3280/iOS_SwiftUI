//
//  G_3280App.swift
//  G-3280
//
//  Created by ParkJunHyuk on 2023/04/30.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
       didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct G_3280App: App {
    var body: some Scene {
        WindowGroup {
            LoginView()
//            ContentView()
        }
    }
}
