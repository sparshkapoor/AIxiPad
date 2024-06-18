//
//  Philly_250_WorkMerkApp.swift
//  Philly 250 WorkMerk
//
//  Created by WorkMerkDev on 6/18/24.
//

import SwiftUI

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
