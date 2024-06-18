//
//  RemoteConfigDelegate.swift
//  Philly 250 WorkMerk
//
//  Created by WorkMerkDev on 6/18/24.
//

import Foundation
import FirebaseRemoteConfig

class RemoteConfigDelegate: ObservableObject {
    @Published var welcomeText: String = "Hello, World!"

    private var remoteConfig: RemoteConfig

    init() {
        self.remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 3600 // Fetch interval in seconds
        self.remoteConfig.configSettings = settings

        // Set default values directly
        self.remoteConfig.setDefaults(["welcome_text": "Hello, World!" as NSObject])

        fetchRemoteConfig()
    }

    private func fetchRemoteConfig() {
        print("Fetching Remote Config...")
        remoteConfig.fetchAndActivate { [weak self] (status, error) in
            DispatchQueue.main.async {
                if status == .successFetchedFromRemote || status == .successUsingPreFetchedData {
                    self?.welcomeText = self?.remoteConfig["welcome_text"].stringValue ?? "Hello, World!"
                } else {
                    print("Config not fetched. Error: \(error?.localizedDescription ?? "No error available.")")
                }
            }
        }
    }
}

