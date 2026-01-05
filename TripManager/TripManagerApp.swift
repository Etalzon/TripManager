//
//  TripManager
//
//  Created by eric locci on 08/12/2025.

import RswiftResources
import SwiftUI

@main
struct TripManagerApp: App {
  // Stocke/charge la valeur depuis `UserDefaults` avec la clé definie par `UserDefaultsKeys.onboardingCompleted`
  @AppStorage(UserDefaultsKeys.onboardingCompleted.rawValue)
  var onboardingCompleted: Bool = false

  // Instance centrale du moteur de l’app (désactive le mode mock)
  let engine = Engine(mock: false)

  var body: some Scene {
    // Déclare la scène principale de l’application
    WindowGroup {
      // Sélectionne la vue en fonction de l’état d’onboarding
      if onboardingCompleted {
        // Vue principale de l’app une fois l’onboarding terminé
        MainTabView(engine: engine)
      } else {
        // Vue d’onboarding affichée au premier lancement ou tant que non complété
        OnboardingScreen()
      }
    }
  }
}
