//
//  AppDelegate.swift
//  Philly 250 WorkMerk
//
//  Created by WorkMerkDev on 6/18/24.
//

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
