//
//  Philly_250_WorkMerkApp.swift
//  Philly 250 WorkMerk
//
//  Created by WorkMerkDev on 6/18/24.
//

import SwiftUI
import Firebase
import FirebaseRemoteConfigSwift
import UIKit
import SwiftUI
import Firebase
import FirebaseCore
import FirebaseFirestore
import FirebaseRemoteConfigSwift
import FirebaseSharedSwift


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct Philly_250_WorkMerkApp: App {
    // Create an instance of AppDelegate
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
        
    var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }
    }
}
