//  TripManagerApp.swift
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import SwiftUI

@main
struct TripManagerApp: App {
  @AppStorage(UserDefaultsKeys.onboardingCompleted.rawValue)
  var onboardingCompleted: Bool = false

  var body: some Scene {
      WindowGroup {
        MyTripsMapView()
        /*if onboardingCompleted {
          MainTabView()
        } else {
          OnboardingScreen()
        }*/
      }
  }
}
