//
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import RswiftResources
import SwiftUI

@main
struct TripManagerApp: App {
  @AppStorage(UserDefaultsKeys.onboardingCompleted.rawValue)
  var onboardingCompleted: Bool = false

  var body: some Scene {
      WindowGroup {
        if onboardingCompleted {
          MainTabView()
        } else {
          OnboardingScreen()
        }
      }
  }
}
