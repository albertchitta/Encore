//
//  EncoreApp.swift
//  Encore
//
//  Created by Albert Chittaphong on 10/7/26.
//

import SwiftUI
import SwiftData

@main
struct EncoreApp: App {
    @AppStorage("hasCompletedOnboarding") private var hasCompletedOnboarding = false
    
    var body: some Scene {
        WindowGroup {
            if hasCompletedOnboarding {
                MainTabView()
            } else {
                OnboardingView()
            }
        }
        .modelContainer(for: Show.self)
    }
}
